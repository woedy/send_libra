import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';
import 'dart:async';

import '../Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  List<String> _imagePaths = ['assets/images/log1.png', 'assets/images/log2.png', 'assets/images/log3.png', 'assets/images/log4.png', 'assets/images/log5.png', 'assets/images/log6.png'];
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller!);

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex++;
        });

        if (_currentIndex < _imagePaths.length) {
          _controller!.reset();
          _controller!.forward();
        }
      }
    });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 4),
            ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnboardingScreen()))
    );

    return Scaffold(
      backgroundColor: libraPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < _imagePaths.length; i++)
              if (i <= _currentIndex)
                Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FadeTransition(
                        opacity: _opacityAnimation!,
                        child: Image.asset(
                          _imagePaths[i],
                          //width: 200,
                          //height: 200,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
