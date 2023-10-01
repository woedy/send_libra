import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:send_libra/Screens/SendMoney/models/confirm_transaction_model.dart';
import 'package:send_libra/constants.dart';

import '../../HomeScreen/HomeScreen.dart';




Future<ConfirmTransactionModel> confirmTransaction(email, code, trans_session_id) async {

  final response = await http.patch(
    Uri.parse(hostName + "/api/v1/transactions/" + trans_session_id + "/confirm"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Bearer': (await getApiPref()).toString()

    },
    body: jsonEncode({
      "username": email,
      "confirmation_code": code,
    }),
  );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return ConfirmTransactionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return ConfirmTransactionModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Verify');
  }
}



class ConfirmTransaction extends StatefulWidget {
  final email;
  final trans_session_id;
  final data;
  final card_data;
  final bank_data;
  final image;
  const ConfirmTransaction({Key? key, required this.email, required this.trans_session_id, required this.data, this.card_data, this.bank_data, this.image}) : super(key: key);

  @override
  State<ConfirmTransaction> createState() => _ConfirmTransactionState();
}

class _ConfirmTransactionState extends State<ConfirmTransaction>  with SingleTickerProviderStateMixin {
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



    return (_futureConfirmTransaction == null) ? buildColumn() : buildFutureBuilder();



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
                            image: AssetImage('assets/images/mtn2.png',), fit: BoxFit.cover,
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
                              Text("Mtn Mobile Money", style: TextStyle(fontSize: 20, ),),
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

                             /* Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                                    (route) => false,
                              );*/

                              setState(() {
                                _futureConfirmTransaction = confirmTransaction(widget.email, "code", widget.trans_session_id);

                              });
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

  //647eaa520cc53

  FutureBuilder<ConfirmTransactionModel> buildFutureBuilder() {
    return FutureBuilder<ConfirmTransactionModel>(
        future: _futureConfirmTransaction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
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
                        Text("is confirming your transaction",
                          style: TextStyle(fontSize: 27, color: libraPrimary),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotationTransition(
                                turns: _controller!,
                                child: Image(image: AssetImage("assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )


                )

            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#######################");
            print(data.message);

            if(data.message == "Transaction confirmed successfully") {

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
                                Lottie.asset('assets/lottie/celebration.json'),
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
                                        Text("Hooray!\nMoney sent",
                                          style: TextStyle(fontSize: 36, color: libraPrimary),
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

                      );
                    }
                );

              });

              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              });


            }else {


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
                                    height: 270,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(data.message!,
                                          style: TextStyle(fontSize: 23, color: libraPrimary),
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


              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmTransaction(email: widget.email, trans_session_id: widget.trans_session_id, data: widget.data,)),
                      (route) => false,
                );
              });


              }

            }
          }

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*CircularProgressIndicator(),
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



}

//noxeke3275@ozatvn.com

