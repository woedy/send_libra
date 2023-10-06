import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:send_libra/Screens/SendMoney/models/confirm_transaction_model.dart';
import 'package:send_libra/constants.dart';

import '../../HomeScreen/HomeScreen.dart';





class TransactionCompleteScreen extends StatefulWidget {
  final data;
  final image;

  const TransactionCompleteScreen({Key? key, required this.data, required this.image}) : super(key: key);

  @override
  State<TransactionCompleteScreen> createState() => _TransactionCompleteScreenState();
}

class _TransactionCompleteScreenState extends State<TransactionCompleteScreen>  with SingleTickerProviderStateMixin {
  Future<ConfirmTransactionModel>? _futureConfirmTransaction;

  String? code;
  AnimationController? _controller;



  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }


  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {
    print("#################");
    print(widget.data.toString());



    return buildColumn();



  }
  //_futureConfirmTransaction = confirmTransaction(widget.email, code!, widget.trans_session_id);


  buildColumn() {
    //Navigator.pop(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Image(image: AssetImage("assets/images/libra-small.png"),)),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transfer Details", style: TextStyle(fontSize: 36),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Your transaction is being processed by WorldPay.", textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              /*Image(
                                image: AssetImage('assets/images/user7.png',), fit: BoxFit.cover,
                                height: 59,
                                width: 59,
                              ),*/

                              if(widget.image == "")...[
                                Container(
                                  height: 59,
                                  width: 59,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text(widget.data!.benefName.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: libraPrimary),),
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

                                  Text(widget.data!.benefName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(widget.data!.benefTel, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),),



                                ],
                              )
                            ],
                          ),
                          Image(
                            image: AssetImage('assets/launcher/libra_launcher.png',), fit: BoxFit.cover,
                            height: 59,
                            width: 59,
                          ),
                        ],
                      ),


                      SizedBox(
                        height: 40,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You sent", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          Text("\£" + widget.data!.sendAmount, style: TextStyle(fontSize: 36),),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(child: Text("Transfer Fee", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                          Expanded(child: Text("Exchange Rate", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text("\$0.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                          Expanded(child: Text("1 GBP = 14.45 GHS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You sent", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          Text("Ghc " + widget.data!.receiveAmount, style: TextStyle(fontSize: 36, color: clay),),
                        ],
                      ),


                      SizedBox(
                        height: 40,
                      ),

                      Text("Sending", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text("Mtn Mobile Money", style: TextStyle(fontSize: 20, ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(widget.data!.benefTel, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            ],
                          ),

                          Image(
                            image: AssetImage('assets/launcher/libra_launcher.png',), fit: BoxFit.cover,
                            height: 59,
                            width: 59,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Align(
                      child: Container(
                        width: 384,
                        height: 55,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: libraBlue,
                            borderRadius: BorderRadius.circular(15)

                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){

                               Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                                    (route) => false,
                              );


                            },
                            child: Align(
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Go To Dashboard", style: TextStyle(fontSize: 15, color: Colors.white),),
                                    SizedBox(
                                      width: 0,
                                    ),
                                    //Icon(Icons.arrow_forward, color: Colors.white,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),







              ],
            ),
          ),
        ),
      ),
    );
  }



}



