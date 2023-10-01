import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class LoadingVerificationDialog1 extends StatefulWidget {
  final amount;
  final initials;
  final full_name;
  final mobile;
  final image;
  final Function() onCountdownComplete;

  const LoadingVerificationDialog1({
    Key? key,
    required this.amount,
    required this.full_name,
    required this.mobile,
    this.initials,
    this.image,
    required this.onCountdownComplete,
  }) : super(key: key);

  @override
  _LoadingVerificationDialog1State createState() =>
      _LoadingVerificationDialog1State();
}

class _LoadingVerificationDialog1State
    extends State<LoadingVerificationDialog1> {
  bool addToQuickSend = false;
  late SharedPreferences _prefs;
  Widget? dialogBoxx;
  int _countdown = 5;

  @override
  void initState() {
    super.initState();
    _startVerificationProcess();
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      addToQuickSend = _prefs.getBool('addToQuickSend') ?? false;
    });
  }

  void _startVerificationProcess() async {
    setState(() {
      dialogBoxx = _widget1(_countdown);
    });

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdown < 1) {
          timer.cancel();
        } else {
          _countdown -= 1;
          dialogBoxx = _widget1(_countdown);
        }
      });
    });

    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pop(); // remove dialog
    widget.onCountdownComplete();
  }

  Widget _widget1(countdown) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/libra-dialog.png")),
            SizedBox(
              height: 30,
            ),
            Text(
              "is sending £${widget.amount.toString()} to",
              style: TextStyle(fontSize: 27, color: Colors.blue),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: addToQuickSend,
                      onChanged: (newValue) {
                        setState(() {
                          addToQuickSend = newValue!;
                          _prefs.setBool('addToQuickSend', newValue);
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text("Add to quick send",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: Container(
                    // ... Your Cancel button UI ...
                  ),
                ),
              ],
            ),
            // ... Rest of your dialog content ...
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return dialogBoxx!;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

