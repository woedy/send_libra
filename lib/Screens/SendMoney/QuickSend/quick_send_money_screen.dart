import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/SendMoney/QuickSend/confirm_transaction.dart';
import 'package:send_libra/Screens/SendMoney/models/create_transaction_model.dart';
import 'package:send_libra/Screens/SendMoney/send_money_dialog_box1.dart';
import 'package:send_libra/Screens/SendMoney/send_money_dialog_box_quick_send.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;

import '../../HomeScreen/HomeScreen.dart';

Future<CreateTransactionModel> createTransaction(data) async {
  var email = await getUserIDPref();
  print(email);

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/transactions"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Bearer': (await getApiPref()).toString()
    },
    body: jsonEncode(data),

  );

  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to send money');
  }
}


class QuickSendMoneyScreen extends StatefulWidget {
  final beneficiary_id;
  final fname;
  final lname;
  final phone;
  final avatar;



  const QuickSendMoneyScreen({Key? key, required this.beneficiary_id, required this.fname, required this.lname, required this.phone, required this.avatar}) : super(key: key);

  @override
  State<QuickSendMoneyScreen> createState() => _QuickSendMoneyScreenState();
}

class _QuickSendMoneyScreenState extends State<QuickSendMoneyScreen> with SingleTickerProviderStateMixin  {

  Future<CreateTransactionModel>? _futureCreateTransaction;

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

    return (_futureCreateTransaction == null) ? buildColumn() : buildFutureBuilder();

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

                                        Text(widget.fname.toString() + " " + widget.lname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
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
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) {

                                  /*setState(() {
                                    dialogBoxx = _widget1(_countdown);
                                  });*/

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
                                    "payment_method": 11,
                                    "payment_token":"",
                                    "service_level": 1
                                  };




                                  return LoadingVerificationDialogQuicksend(
                                    amount: _number != "" ? double.tryParse(_number) : 0.0,
                                    full_name: widget.fname.toString() + " " + widget.lname.toString(),
                                    mobile: widget.phone,
                                    image: widget.avatar,
                                    fname: widget.fname.toString(),
                                    lname: widget.lname.toString(),
                                    benef_id: widget.beneficiary_id,
                                    onCountdownComplete: () {
                                      setState(() {
                                        _futureCreateTransaction = createTransaction(_data);
                                      });
                                    },
                                  );
                                },
                              );
                              log('Deletion confirmed: $confirmed');
                              return confirmed;
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


  FutureBuilder<CreateTransactionModel> buildFutureBuilder() {
    return FutureBuilder<CreateTransactionModel>(
        future: _futureCreateTransaction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 300,
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
                        Text("Your money is\non the way...",
                          style: TextStyle(fontSize: 30, color: libraPrimary),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if(widget.avatar == "")...[
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
                                    image: MemoryImage(base64Decode(widget.avatar)), fit: BoxFit.cover,
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

                                    Text(widget.fname.toString() + " " + widget.lname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: libraPrimary),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(widget.phone.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: libraPrimary.withOpacity(0.5)),),



                                  ],
                                ),
                              ],
                            ),
                            RotationTransition(
                                turns: _controller!,
                                child: Image(image: AssetImage("assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )


                )

            );

          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("######################");
            print(data.message);

            if(data.message == "Transaction is being processed. Check your email for the confirmation code.") {

              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: Colors.white),

                            child: Stack(
                              children: [
                                //Image(image: AssetImage("assets/images/sprinkles.png")),
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
                                        Text("Transaction made.",
                                          style: TextStyle(fontSize: 25, color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                if(widget.avatar == "")...[
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
                                                    image: MemoryImage(base64Decode(widget.avatar)), fit: BoxFit.cover,
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

                                                    Text(widget.fname.toString() + " " + widget.lname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: libraPrimary),),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(widget.phone.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: libraPrimary.withOpacity(0.5)),),



                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image(image: AssetImage("assets/icons/verify_check.png")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                ),
                              ],
                            ),
                          )

                      );
                    }
                );

              });

              Future.delayed(const Duration(seconds: 2), () async {
                var _email = await getUserIDPref();
                var _data = data.data;
                setState(() {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmTransaction(email: _email, trans_session_id: data.data!.transSessionId, data: _data, image: widget.avatar)),
                        (route) => false,
                  );
                });

              });

            }
            else if(data.message == "Please update your profile to complete registration first") {

              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: Colors.white),

                            child: Stack(
                              children: [
                                Container(
                                    height: 300,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(data.message!,
                                          style: TextStyle(fontSize: 25, color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.error_outline, color: Colors.red, size: 40,)
                                          ],
                                        ),
                                      ],
                                    )


                                ),
                              ],
                            ),
                          )

                      );
                    }
                );

              });

              Future.delayed(const Duration(seconds: 2), () async {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              });

            }

            else if(data.message == "Account awaiting verification.") {

              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: Colors.white),

                            child: Stack(
                              children: [
                                Container(
                                    height: 300,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(data.message!,
                                          style: TextStyle(fontSize: 30, color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.error_outline, color: Colors.red, size: 40,)
                                          ],
                                        ),
                                      ],
                                    )


                                ),
                              ],
                            ),
                          )

                      );
                    }
                );

              });

              Future.delayed(const Duration(seconds: 2), () async {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              });

            }

            else if(data.message == "Compliance check(s) failed") {

              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: Colors.white),

                            child: Stack(
                              children: [
                                Container(
                                    height: 300,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text("Please update your profile to increase your sending limit.",
                                          style: TextStyle(fontSize: 27, color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.error_outline, color: Colors.red, size: 40,)
                                          ],
                                        ),
                                      ],
                                    )


                                ),
                              ],
                            ),
                          )

                      );
                    }
                );

              });

              Future.delayed(const Duration(seconds: 2), () async {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              });

            }

          }



          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*   CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")*/
                ],
              ),
            ),
          );


        }
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
