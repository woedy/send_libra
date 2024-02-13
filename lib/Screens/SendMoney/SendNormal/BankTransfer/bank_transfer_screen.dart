import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/Screens/SendMoney/QuickSend/confirm_transaction.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/BankTransfer/brank_confirm_transaction.dart';
import 'package:send_libra/Screens/SendMoney/models/create_transaction_model.dart';
import 'package:send_libra/Screens/SendMoney/send_money_dialog_box1.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/confirm_transaction_model.dart';


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

class BankTransferScreen extends StatefulWidget {
  final data;
  final transaction_type;
  final beneficiary_id;
  final fname;
  final lname;
  final phone;
  final avatar;


  const BankTransferScreen({Key? key, required this.data, required this.transaction_type,  required this.beneficiary_id, required this.fname, required this.lname, required this.phone, required this.avatar}) : super(key: key, );

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> with SingleTickerProviderStateMixin  {


  Future<CreateTransactionModel>? _futureCreateTransaction;
  AnimationController? _controller;


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

    print("###############################");
    print("widget.data");
    print(widget.data);

    return (_futureCreateTransaction == null) ? buildColumn(context) : buildFutureBuilder();
  }

  Widget buildColumn(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height,

            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
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
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              Text("----", style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
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
                          Text("GBP " + widget.data['amount'].toString(), style: TextStyle(color: clay, fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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

                                print(widget.data["amount"]);

                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return LoadingVerificationDialog1(
                                      amount: widget.data["amount"],
                                      full_name: widget.fname.toString() + " " + widget.lname.toString(),
                                      mobile: widget.phone,
                                      image: widget.avatar,
                                      benef_id: widget.beneficiary_id,
                                      fname: widget.fname.toString(),
                                      lname: widget.lname.toString(),
                                      onCountdownComplete: () {
                                        setState(() {
                                          _futureCreateTransaction = createTransaction(widget.data);
                                        });
                                      },
                                    );

                                  },
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
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),







              ],
            ),
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

            var _data = snapshot.data!;

            _processTransactionResponse(context, _data);
            return const SizedBox();

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



  Future<void> _processTransactionResponse(BuildContext context, data) async {
    if(data.message == "Transaction is being processed. Check your email for the confirmation code.") {


      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context){
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
                          Text("is confirming transaction..",
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
        );

      });


      var confirmationData = await confirmTransaction(widget.data['username'], "code", data.data!.transSessionId);



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

      //Navigator.pop(context);

      Future.delayed(const Duration(seconds: 2), () async {

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          BankConfirmTransaction(data: confirmationData.data, image: "", email: widget.data['username'], trans_ref: confirmationData.data!.transRef!.toString(),)), (Route<dynamic> route) => false);

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
      print("###################");
      print("###################");
      print("TTANNNSSSSSSSSSSSSS");
      print(jsonDecode(response.body)['data']['trans_ref']);
      return ConfirmTransactionModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 422) {
      print(jsonDecode(response.body));
      return ConfirmTransactionModel.fromJson(jsonDecode(response.body));
    }  else {

      throw Exception('Failed to Verify');
    }
  }




}



