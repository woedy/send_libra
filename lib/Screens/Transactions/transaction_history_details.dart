import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:send_libra/Screens/SendMoney/QuickSend/confirm_transaction.dart';
import 'package:send_libra/Screens/SendMoney/models/create_transaction_model.dart';
import 'package:send_libra/Screens/SendMoney/models/payment_instruction_model.dart';
import 'package:send_libra/Screens/SendMoney/resend_money_dialog_box.dart';
import 'package:send_libra/Screens/Transactions/generate_pdf.dart';
import 'package:send_libra/Screens/Transactions/to_world_pay.dart';
import 'package:send_libra/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../HomeScreen/HomeScreen.dart';
import 'package:http/http.dart' as http;


Future<CreateTransactionModel> createTransaction(data) async {
  var email = await getUserIDPref();

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
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 403) {
    return CreateTransactionModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to send money');
  }
}



Future<PaymentInstructionModel> callPaymentInstructions(username, trans_ref) async {

  print("###########################");
  print("PAYMENTS inssssssssssss");
  print(username);
  print(trans_ref);



  final response = await http.get(
    Uri.parse(hostName + "/api/v1/transactions/" + trans_ref + "/payment-instructions?username=" + username.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Bearer': (await getApiPref()).toString()

    },
  );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    print("###################");
    print("###################");

    print(jsonDecode(response.body)['data']['r1_trans_payment_url']);


    return PaymentInstructionModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return PaymentInstructionModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load');
  }


}







class TransactionDetailsScreen extends StatefulWidget {
  final data;
  const TransactionDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController(text: "");
  Future<dynamic>? _futureData;

  AnimationController? _controller;


  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;

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
    print(widget.data);
    return (_futureData == null) ? buildColumn() : buildFutureBuilder();
  }


  Widget buildColumn() {
    print("########################");
    print("########################");
    print("########################");
    print("########################");
    print(widget.data.toJson());
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
                                            child: Text(widget.data.status.toString(), style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),)),

                                      ],
                                    ),

                                  ],
                                ),


                                  Image(
                                      height: 82,
                                      image: AssetImage("assets/launcher/libra_launcher.png")),


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

                        if(widget.data.paymentMethod == "41" && widget.data.status == "PENDING_CLEARANCE")...[
                          Align(
                            child: Container(
                              width: 384,
                              height: 55,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfoMore()));

                                  },
                                  child: InkWell(
                                    onTap: () async {
                                      var _username =  await getUserIDPref();

                                     /* Future.delayed(const Duration(seconds: 2), () async {

                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomeScreen()),
                                              (route) => false,
                                        );
                                      });
*/

                                      setState(() {
                                      _futureData = callPaymentInstructions(_username, widget.data.transRef);
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
                                            Text(
                                              "Pay Now",
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
                          ),

                        ],


                /*        Column(
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
                        ),*/

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
                                            child: InkWell(
                                              onTap: () async {
                                                var _username =  await getUserIDPref();

                                                var _data = {
                                                  "username": _username,
                                                  "transaction_type": "Mobile Transfer",
                                                  "beneficiary_id": widget.data.benefId,
                                                  "source_currency": "GBP",
                                                  "destination_currency": "GHS",
                                                  "amount_type": "SOURCE",
                                                  "amount": widget.data.sourceAmount.toString(),
                                                  "purpose": "Family Support",
                                                  "source_of_income":"",
                                                  "payment_method": 11,
                                                  "payment_token":"",
                                                  "service_level": 1
                                                };


                                                showDialog<void>(
                                                  context: context,
                                                  barrierDismissible: false, // user must tap button!
                                                  builder: (BuildContext context) {
                                                    return  ResendLoadingVerificationDialog(
                                                      amount: widget.data.sourceAmount.toString(),
                                                      initials: widget.data.benefName.toString().substring(0, 1) ,
                                                      full_name: widget.data.benefName.toString(),
                                                      mobile: widget.data.benefMobile,
                                                      onCountdownComplete: () {
                                                        setState(() {
                                                          _futureData = createTransaction(_data);
                                                        });
                                                      },
                                                    );
                                                  },
                                                );
                                                //show_countdown(_data);

                                                /*setState(() {
                                                    _futureCreateTransaction = createTransaction(_data);
                                                  });*/
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
                                            onTap: () async {

                                              var _username =  await getUserIDPref();

                                              var _data = {
                                                "username": _username,
                                                "trans_ref": widget.data.transRef,
                                                "beneficiary_id": widget.data.benefId,
                                                "beneficiary_name": widget.data.benefName,
                                                "beneficiary_mobile": widget.data.benefMobile,
                                                "source_currency": "GBP",
                                                "destination_currency": "GHS",
                                                "amount": widget.data.sourceAmount.toString(),
                                                "purpose": "Family Support",
                                                "transaction_date": widget.data.creationDate
                                              };



                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PdfGeneratePage(data: _data,)));

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




  FutureBuilder<dynamic> buildFutureBuilder() {
    return FutureBuilder<dynamic>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage(
                            "assets/images/libra-dialog.png")),
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
                                Container(
                                  height: 59,
                                  width: 59,
                                  decoration: BoxDecoration(
                                      color: libraPrimary,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text(widget.data.benefName.toString()
                                        .substring(0, 1), style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  ),
                                ),

                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(widget.data.benefName.toString(),
                                      style: TextStyle(fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: libraPrimary),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(widget.data.benefMobile.toString(),
                                      style: TextStyle(fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: libraPrimary.withOpacity(
                                              0.5)),),


                                  ],
                                ),
                              ],
                            ),
                            RotationTransition(
                                turns: _controller!,
                                child: Image(image: AssetImage(
                                    "assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )


                )

            );
          }
          else if (snapshot.hasData) {
            var data = snapshot.data!;

            if (snapshot.data is CreateTransactionModel) {
            if (data.message ==
                "Transaction is being processed. Check your email for the confirmation code.") {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),

                            child: Stack(
                              children: [
                                //Image(image: AssetImage("assets/images/sprinkles.png")),
                                Container(
                                    height: 280,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image(image: AssetImage(
                                            "assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "Transaction made. Please confirm.",
                                          style: TextStyle(fontSize: 25,
                                              color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 59,
                                                  width: 59,
                                                  decoration: BoxDecoration(
                                                      color: libraPrimary,
                                                      borderRadius: BorderRadius
                                                          .circular(10)
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      widget.data.benefName
                                                          .toString().substring(
                                                          0, 1),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight
                                                              .bold),),
                                                  ),
                                                ),

                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [

                                                    Text(widget.data.benefName
                                                        .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          color: libraPrimary),),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(widget.data.benefMobile
                                                        .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          color: libraPrimary
                                                              .withOpacity(
                                                              0.5)),),


                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                Image(image: AssetImage(
                                                    "assets/icons/verify_check.png")),
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
                    MaterialPageRoute(builder: (context) =>
                        ConfirmTransaction(email: _email,
                            trans_session_id: _data!.transSessionId,
                            data: _data,
                            image: "")),
                        (route) => false,
                  );
                });
              });
            }
            else if (data.message ==
                "Please update your profile to complete registration first") {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),

                            child: Stack(
                              children: [
                                Container(
                                    height: 300,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image(image: AssetImage(
                                            "assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(data.message!,
                                          style: TextStyle(fontSize: 25,
                                              color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                          children: [
                                            Icon(Icons.error_outline,
                                              color: Colors.red, size: 40,)
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

            else if (data.message == "Account awaiting verification.") {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),

                            child: Stack(
                              children: [
                                Container(
                                    height: 300,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image(image: AssetImage(
                                            "assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(data.message!,
                                          style: TextStyle(fontSize: 30,
                                              color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                          children: [
                                            Icon(Icons.error_outline,
                                              color: Colors.red, size: 40,)
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
          }else if (snapshot.data is PaymentInstructionModel) {
              if (data.message ==
                  "Payment instructions retrieved successfully"){

                 callWorldPay(snapshot.data.data!.r1TransPaymentUrl.toString());

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

  void callWorldPay(link) async{

    await launchUrl(
    Uri.parse(link),
    mode: LaunchMode.externalApplication,);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ToWorldPay()),
          (route) => false,
    );
  }







}

