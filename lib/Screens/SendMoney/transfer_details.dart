import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/constants.dart';

import '../HomeScreen/HomeScreen.dart';

class TransferDetails extends StatefulWidget {
  final data;
  const TransferDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<TransferDetails> createState() => _TransferDetailsState();
}

class _TransferDetailsState extends State<TransferDetails> {

  @override
  Widget build(BuildContext context) {


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
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Transfer Details", style: TextStyle(fontSize: 36),),
                      SizedBox(
                        height: 40,
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
                          Expanded(child: Text("1 GBP = 7.3434 GHS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
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
                            image: AssetImage('assets/images/mtn2.png',), fit: BoxFit.cover,
                            height: 59,
                            width: 59,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40,
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
                                    Text("Continue", style: TextStyle(fontSize: 15, color: Colors.white),),
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
