import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:send_libra/constants.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final data;
  const TransactionDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  TextEditingController controller = TextEditingController(text: "");



  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;


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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    ),
                  ],
                ),
                Container(

                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 10,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Container(
                                      height: 82,
                                      width: 82,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,

                                      ),
                                      child: Center(
                                        child: Text(widget.data.benefName.toString().substring(0, 1), style: TextStyle(color: libraPrimary, fontSize: 25, fontWeight: FontWeight.bold),),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Container(
                                        width: 185,
                                            //color: Colors.red,
                                            child: Text(widget.data.benefName.toString(), style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),)),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.data.creationDate.toString())), style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.green
                                            ),
                                            child: Text("Completed", style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),)),

                                      ],
                                    ),

                                  ],
                                ),
                                Image(
                                    height: 82,
                                    image: AssetImage("assets/images/mtn.png")),

                              ],
                            ),


                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(

                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text("Amount Sent"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: clay,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                  height: 14,
                                                  image: AssetImage("assets/images/ukflag.png")),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("GBP", style: TextStyle(fontSize: 12),)
                                            ],

                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(widget.data.sourceAmount.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text("Amount Received"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: clay,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Row(
                                            children: [
                                              Image(
                                                  height: 14,
                                                  image: AssetImage("assets/images/ghflag.png")),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("GHS", style: TextStyle(fontSize: 12),)
                                            ],

                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(widget.data.destAmount.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Transaction Referral Number", style: TextStyle(fontSize: 14, color: Colors.white,),),
                            InkWell(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: widget.data.transRef.toString()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Transaction Referral Number copied to clipboard')),
                                );
                              },
                              child: Image(
                                  height: 28,
                                  image: AssetImage("assets/icons/copybutton.png")),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.data.transRef.toString(), style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),


                        SizedBox(
                          height: 20,
                        ),

                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Transfer Instruction Received", style: TextStyle(fontSize: 18, color: libraPrimary, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 14, color: libraPrimary),),
                                    ],
                                  ),
                                  Icon(Icons.check_circle, color: Colors.green,)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Payment Received", style: TextStyle(fontSize: 18, color: libraPrimary, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 14, color: libraPrimary),),
                                    ],
                                  ),
                                  Icon(Icons.check_circle, color: Colors.green,)
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sent to Bank", style: TextStyle(fontSize: 18, color: libraPrimary, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 14, color: libraPrimary),),
                                    ],
                                  ),
                                  Icon(Icons.blur_circular, color: Colors.orange,)
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sent to Bank", style: TextStyle(fontSize: 18, color: libraPrimary, fontWeight: FontWeight.w600),),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 14, color: libraPrimary),),
                                    ],
                                  ),
                                  Icon(Icons.circle_outlined, color: Colors.red,)
                                ],
                              ),
                            ),



                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),



                        Container(
                          height: MediaQuery.of(context).size.height,

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
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
                                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfoMore()));

                                            },
                                            child: Align(
                                              child: Container(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Resend",
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
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      child: Container(
                                        width: 384,
                                        height: 55,
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfoMore()));

                                            },
                                            child: Align(
                                              child: Container(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Download",
                                                      style: TextStyle(
                                                          fontSize: 15, color: libraPrimary),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }




}

