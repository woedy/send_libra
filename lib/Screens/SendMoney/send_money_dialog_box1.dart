import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/SendMoney/transfer_details.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoadingVerificationDialog1 extends StatefulWidget {
  final amount;
  final full_name;
  final mobile;
  final image;
  final benef_id;
  final fname;
  final lname;
  final Function() onCountdownComplete;

  const LoadingVerificationDialog1({Key? key, required this.amount, required this.full_name, required this.mobile, this.image, this.benef_id,this.fname, this.lname, required this.onCountdownComplete}) : super(key: key);

  @override
  _LoadingVerificationDialog1State createState() => _LoadingVerificationDialog1State();
}

class _LoadingVerificationDialog1State extends State<LoadingVerificationDialog1> {
  Widget? dialogBoxx;

  bool addToQuickSend = false; // Track the checked state
  late SharedPreferences _prefs; // SharedPreferences instance

  List<Map<String, dynamic>> quickSendList = [];

  int _countdown = 5;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    _startVerificationProcess();




  }

  // Initialize SharedPreferences instance
  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      final quickSendListString = _prefs.getStringList('quickSendList');
      if (quickSendListString != null) {
        quickSendList = quickSendListString
            .map((item) => jsonDecode(item) as Map<String, dynamic>)
            .toList();

        // Check if the object is in the quickSendList
        final isObjectInList = quickSendList.any((item) =>
        item['benef_id'] == widget.benef_id); // Example data

        addToQuickSend = isObjectInList;
      }
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
                      if(widget.image == "")...[
                        Container(
                          height: 59,
                          width: 59,
                          decoration: BoxDecoration(
                              color: libraPrimary,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(widget.fname.toString().substring(0, 1) + widget.lname.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ]else...[
                        Image(
                          image: MemoryImage(base64Decode(widget.image)), fit: BoxFit.cover,
                          height: 59,
                          width: 59,
                        )
                      ],

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
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/launcher/libra_launcher.png',),
                        fit: BoxFit.cover
                      )
                    ),

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
                      Checkbox(
                        value: addToQuickSend,
                        activeColor: Colors.green,
                        onChanged: (newValue) {
                          setState(() {
                            addToQuickSend = newValue!;
                            _prefs.setBool('addToQuickSend', newValue);

                            if (addToQuickSend) {
                              quickSendList.add({
                                "benef_id": widget.benef_id, // Example data
                                "fname": widget.fname,
                                "lname": widget.lname,
                                "avatar": widget.image,
                                "mobile": widget.mobile
                                // ... Include other properties ...
                              });
                            } else {
                              quickSendList.removeWhere((item) =>
                              item['benef_id'] == widget.benef_id); // Example data
                            }

                            _prefs.setStringList(
                              'quickSendList',
                              quickSendList.map((item) => jsonEncode(item)).toList(),
                            );
                          });
                        },
                      ),
                      SizedBox(width: 5),
                      Text("Add to quick send", style: TextStyle(color: libraPrimary)),
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