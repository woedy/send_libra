import 'dart:async';

import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class CustomLibraDialog extends StatefulWidget {
  String? message1;
  String? message2;
  bool? is_celebration;

  CustomLibraDialog({super.key, required this.message1, required this.message2, required this.is_celebration});



  @override
  _CustomLibraDialogState createState() => _CustomLibraDialogState();
}

class _CustomLibraDialogState extends State<CustomLibraDialog> {
  bool _isVerifying = true;
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isVerifying = false;
        _isVerified = true;
      });
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child:_isVerifying ?
      Container(
        height: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: EdgeInsets.all(20),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage("assets/images/libra-dialog.png")),
                  SizedBox(
                    height: 30,
                  ),
                  Text(widget.message1!,
                    style: TextStyle(fontSize: 27, color: libraPrimary),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(image: AssetImage("assets/icons/loading.png")),
                    ],
                  ),
                ],
              )


      )
          : _isVerified ?
      Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),

        child: Stack(
          children: [
            if(widget.is_celebration!)...[
              Image(image: AssetImage("assets/images/sprinkles.png")),
            ],
            Container(
                height: 280,

                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/images/libra-dialog.png")),
                    SizedBox(
                      height: 30,
                    ),
                    Text(widget.message2!,
                      style: TextStyle(fontSize: 27, color: libraPrimary),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(image: AssetImage("assets/icons/verify_check.png")),
                      ],
                    ),
                  ],
                )


            ),
          ],
        ),
      )
          : Container(),
    );
  }
}
