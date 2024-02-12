import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:send_libra/Screens/SendMoney/models/confirm_transaction_model.dart';
import 'package:send_libra/constants.dart';

import '../../../HomeScreen/HomeScreen.dart';




class BankConfirmTransaction extends StatefulWidget {
  final email;
  final trans_ref;
  final data;
  final card_data;
  final bank_data;
  final image;
  const BankConfirmTransaction({Key? key, required this.email, required this.trans_ref, required this.data, this.card_data, this.bank_data, this.image}) : super(key: key);

  @override
  State<BankConfirmTransaction> createState() => _BankConfirmTransactionState();
}

class _BankConfirmTransactionState extends State<BankConfirmTransaction>  with SingleTickerProviderStateMixin {

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



    return buildColumn(context);



  }
  //_futureConfirmTransaction = confirmTransaction(widget.email, code!, widget.trans_session_id);


  Widget buildColumn(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                  /*  Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      child:    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: libraPrimary,
                                width: 1,
                              ),
                              color: clay
                          ),
                          child: Icon(Icons.arrow_back, color: Colors.white,),
                        ),
                      ),
                    ),*/
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                              TextSpan(
                                text: "Payment Instructions",
                                style: TextStyle(fontSize: 35,  ),

                              )
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Your transfer to Libra will be processed after we receive your payment", style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.4) )),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.check_box, color: clay,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Text("Visit your bank, either online or in-person and make the payment", style: TextStyle(fontSize: 14, ))),

                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_box, color: clay,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Text("Pay the total amount shown using the details below.", style: TextStyle(fontSize: 14, ))),

                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_box, color: clay,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Text("Make sure you enter the payment reference indicated below", style: TextStyle(fontSize: 14, ))),

                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(child: Text("Libra’s Bank Details", style: TextStyle(fontSize: 14 ))),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              //color: libraBlue,
                                border: Border.all(color: libraBlue, width: 3),
                                borderRadius: BorderRadius.circular(50)
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Copy"),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.copy, color: Colors.white, size: 20,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payee/Account Name", style: TextStyle(color: Colors.white.withOpacity(0.4),)),
                              Text("Fortune Portfolio Ltd", style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sort Code", style: TextStyle(color: Colors.white.withOpacity(0.4),)),
                              Text("04-00-75", style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Account Number ", style: TextStyle(color: Colors.white.withOpacity(0.4),)),
                              Text("53 31 27 67", style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payment Reference ", style: TextStyle(color: Colors.white.withOpacity(0.4),)),
                              Text(widget.trans_ref, style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                            ],
                          ),



                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Amount To Pay", style: TextStyle(color: Colors.white.withOpacity(0.4),)),
                          Text("GBP "+widget.data.sendAmount, style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),



                Expanded(
                  flex: 1,
                  child: Align(
                    child: Container(
                      width: 384,
                      height: 55,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: libraBlue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
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
                                  Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),)



              ],
            ),
          ),
        ),
      ),
    );
  }




}

//noxeke3275@ozatvn.com

