import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/select_payment_screen.dart';
import 'package:send_libra/Screens/SendMoney/models/create_transaction_model.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;

import '../../HomeScreen/HomeScreen.dart';



class SendMoneyScreen extends StatefulWidget {
  final beneficiary_id;
  final fname;
  final lname;
  final nickname;
  final phone;
  final avatar;



  const SendMoneyScreen({Key? key, required this.beneficiary_id, required this.fname, required this.lname,required this.nickname, required this.phone, required this.avatar}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> with SingleTickerProviderStateMixin  {


  AnimationController? _controller;
  Widget? dialogBoxx;

  int _countdown = 5;

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

    return buildColumn();


  }


  Widget buildColumn() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    //color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(5),
                    child: Container(

                      decoration: BoxDecoration(
                          color: clay,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [

                                    if(widget.avatar == "")...[
                                      if(widget.nickname == "")...[
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
                                        Container(
                                          height: 59,
                                          width: 59,
                                          decoration: BoxDecoration(
                                              color: libraPrimary,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: Text(widget.nickname.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          ),
                                        ),
                                      ]

                                    ]else...[
                                      Container(
                                        height: 59,
                                        width: 59,
                                        //margin: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: libraLight.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: MemoryImage(base64Decode(widget.avatar)), fit: BoxFit.cover,
                                            )
                                        ),

                                      ),
                                    ],


                                    /*Image(
                                      image: AssetImage('assets/images/user7.png',), fit: BoxFit.cover,
                                      height: 59,
                                      width: 59,
                                    ),*/
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        if(widget.nickname == "")...[
                                          Text(widget.fname.toString() + " " + widget.lname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
                                        ]else...[
                                          Text(widget.nickname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),

                                        ],
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(widget.phone.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),),



                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close, color: Colors.white, size: 30,))
                              ],
                            ),
                            Container(
                              //color: Colors.red,
                              width: 330,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("\£", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),),
                                  Text(_number, overflow: TextOverflow.clip, style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("They will receive ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                                Text("Ghc " + _number_gh, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(

                              child: Row(
                                children: [
                                  _DialNumberButton('1', _updateNumber),
                                  _DialNumberButton('2', _updateNumber),
                                  _DialNumberButton('3', _updateNumber),



                                ],
                              ),
                            )
                        ),
                        Expanded(
                            child: Container(

                              child: Row(
                                children: [
                                  _DialNumberButton('4', _updateNumber),
                                  _DialNumberButton('5', _updateNumber),
                                  _DialNumberButton('6', _updateNumber),



                                ],
                              ),
                            )
                        ),
                        Expanded(
                            child: Container(

                              child: Row(
                                children: [
                                  _DialNumberButton('7', _updateNumber),
                                  _DialNumberButton('8', _updateNumber),
                                  _DialNumberButton('9', _updateNumber),




                                ],
                              ),
                            )
                        ),
                        Expanded(
                            child: Container(

                              child: Row(
                                children: [
                                  _DialNumberButton('.', _updateNumber),
                                  _DialNumberButton('0', _updateNumber),

                                  Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          _clearPhoneNumber();
                                        },
                                        child: Container(

                                          child: Center(
                                            child: Icon(Icons.backspace_outlined, color: Colors.white,),
                                          ),
                                        ),
                                      )
                                  ),


                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Container(
                      //height: 10,
                      //width: 20,
                      padding: EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        //color: clay
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: clay,
                            ),
                            child: Center(
                              child: Text("Swipe to send"),
                            ),
                          ),

                          Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (DismissDirection direction) async {

                              /*showDialog(
                                context: context,
                                builder: (BuildContext context) {

                                  return LoadingVerificationDialog();

                                },
                              );*/
                            },

                             confirmDismiss: (DismissDirection direction) async {
                               if (_number.isEmpty || !isAmountValid(_number)) {
                                 showDialog(
                                   context: context,
                                   builder: (BuildContext context) {
                                     return AlertDialog(
                                       title: Text('Invalid Amount'),
                                       content: Text('Please enter a valid amount between 1 and 1,000,000,000,000.'),
                                       actions: [
                                         ElevatedButton(
                                           onPressed: () => Navigator.pop(context),
                                           child: Text('OK'),
                                         ),
                                       ],
                                     );
                                   },
                                 );
                                 return false;
                               }

                               var _username =  await getUserIDPref();

                               var _data = {
                                 "username": _username,
                                 "transaction_type": "Mobile Transfer",
                                 "beneficiary_id": widget.beneficiary_id,
                                 "source_currency": "GBP",
                                 "destination_currency": "GHS",
                                 "amount_type": "SOURCE",
                                 "amount": _number != "" ? double.tryParse(_number) : 0.0,
                                 "purpose": "Family Support",
                                 "source_of_income":"",
                                 "payment_token":"",
                                 "service_level": 1
                               };


                               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SelectPaymentScreen(
                                 data: _data,
                                 beneficiary_id: widget.beneficiary_id,
                                 fname: widget.fname,
                                 lname: widget.lname,
                                 phone: widget.phone,
                                 avatar: widget.avatar,



                               )));


                             },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(

                                  width: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: libraBlue,
                                  ),
                                  child: Center(
                                    child: Image(image: AssetImage("assets/icons/slide_send.png"),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }




  String _number = '';
  String _number_gh = '';

  void _updateNumber(String number) {
    setState(() {
      _number += number;
      _updateNumberGh(_number);
    });
  }

  void _clearPhoneNumber() {
    setState(() {
      _number = '';
      _number_gh = '';
    });
  }


  void _updateNumberGh(String _number) {
    var rate = 14.45007420;
    var amount = double.parse(_number);

    setState(() {
      _number_gh = (amount * rate).toStringAsFixed(2).toString();
    });


    print("EXCHANGINGGGG");
    print(_number_gh);

  }









}




class _DialNumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  _DialNumberButton(this.number, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: () => onPressed(number),
          child: Container(

            child: Center(
              child: Text(number, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
            ),
          ),
        )
    );
  }
}
