import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/SendMoney/transfer_details.dart';
import 'package:send_libra/constants.dart';


class ResendLoadingVerificationDialog extends StatefulWidget {
  final amount;
  final initials;
  final full_name;
  final mobile;
  final Function() onCountdownComplete;

  const ResendLoadingVerificationDialog({Key? key, required this.amount, required this.full_name, required this.mobile, this.initials, required this.onCountdownComplete}) : super(key: key);

  @override
  _ResendLoadingVerificationDialogState createState() => _ResendLoadingVerificationDialogState();
}

class _ResendLoadingVerificationDialogState extends State<ResendLoadingVerificationDialog> {
  Widget? dialogBoxx;

  int _countdown = 5;

  @override
  void initState() {
    super.initState();
    _startVerificationProcess();



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
   /* Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TransferDetails(),
    ));
*/
    // Trigger external function here.
    widget.onCountdownComplete();


  }

  Widget _widget1(countdown){


    return Dialog(

      insetPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      backgroundColor: Colors.transparent,


      child:  Container(
          height: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage("assets/images/libra-dialog.png")),
              SizedBox(
                height: 30,
              ),
              Text("is sending \£" + widget.amount.toString() + " to" ,
                style: TextStyle(fontSize: 27, color: libraPrimary),
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                    /*  Image(
                        image: AssetImage('assets/images/user7.png',), fit: BoxFit.cover,
                        height: 59,
                        width: 59,
                      ),
*/
                      Container(
                        height: 59,
                        width: 59,
                        decoration: BoxDecoration(
                            color: libraPrimary,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(widget.initials, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(widget.full_name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: libraPrimary),),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.mobile, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: libraPrimary.withOpacity(0.5)),),



                        ],
                      )
                    ],
                  ),
                  Image(
                    image: AssetImage('assets/images/mtn2.png',), fit: BoxFit.cover,
                    height: 59,
                    width: 59,
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_box, color: Colors.green, size: 32,),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Add to quick send", style: TextStyle(color: libraPrimary),),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      if (mounted) {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      }

                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: libraPrimary,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Cancel in " + countdown.toString() + "s"),
                    ),
                  )
                ],
              )


            ],
          )


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