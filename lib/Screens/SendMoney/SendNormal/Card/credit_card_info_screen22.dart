
import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info2.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/Screens/SendMoney/QuickSend/confirm_transaction.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/transaction_complate_screen.dart';
import 'package:send_libra/Screens/SendMoney/models/create_transaction_model.dart';
import 'package:send_libra/Screens/SendMoney/models/payment_instruction_model.dart';
import 'package:send_libra/Screens/SendMoney/send_money_dialog_box1.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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

class CreditCardInfoScreen extends StatefulWidget {
  final data;
  final transaction_type;
  final beneficiary_id;
  final fname;
  final lname;
  final phone;
  final avatar;


  const CreditCardInfoScreen({Key? key, required this.data, required this.transaction_type,  required this.beneficiary_id, required this.fname, required this.lname, required this.phone, required this.avatar}) : super(key: key);

  @override
  State<CreditCardInfoScreen> createState() => _CreditCardInfoScreenState();
}

class _CreditCardInfoScreenState extends State<CreditCardInfoScreen> with SingleTickerProviderStateMixin  {
  TextEditingController controller = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String? full_name;
  String? card_number;
  String? expiry_date;
  String? ccv;
  var card_data;

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





  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;


  @override
  Widget build(BuildContext context) {

    /*print("####################");
    print("####################");
    print("####################");
    print(widget.data);
*/
    return (_futureCreateTransaction == null) ? buildColumn() : buildFutureBuilder();



  }

  Widget buildColumn() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "Payment Instruction",
                            style: TextStyle(fontSize: 38,  ),

                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 40,
                        image: AssetImage("assets/icons/worldpay.png", )
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    flex: 4,
                    child:  SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("Hello valued user,\n\nWe're excited to guide you through the next steps to complete your payment securely and conveniently. In order to ensure a seamless transaction, we will now redirect you to WorldPay, our trusted and reliable payment partner.", style: TextStyle(fontSize: 16),),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(Icons.check_box, color: clay,),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text("WorldPay is a globally recognized payment gateway known for its top-notch security measures. Rest assured, your financial information is in safe hands.", style: TextStyle(fontSize: 16),)),

                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(Icons.check_box, color: clay,),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text("At WorldPay, you'll have a variety of payment options at your disposal. Choose your preferred method and follow the prompts to complete your transaction.", style: TextStyle(fontSize: 16),)),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(Icons.check_box, color: clay,),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text("WorldPay's user-friendly interface will guide you through the payment process step by step. You'll find it easy to input your payment details and finalize the transaction.", style: TextStyle(fontSize: 16),)),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(Icons.check_box, color: clay,),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text("Once your payment is successfully processed, you will receive a confirmation notification from both WorldPay and our platform. This will serve as your receipt and proof of payment.", style: TextStyle(fontSize: 16),)),

                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
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

                                      setState(() {
                                        _futureCreateTransaction = createTransaction(widget.data);
                                      });

                                      /*showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return LoadingVerificationDialog1(
                                  amount: widget.data["amount"],
                                  initials: widget.fname.toString().substring(0, 1) + widget.lname.toString().substring(0, 1),
                                  full_name: widget.fname.toString() + " " + widget.lname.toString(),
                                  mobile: widget.phone,
                                  image: widget.avatar,
                                  onCountdownComplete: () {
                                    setState(() {
                                      _futureCreateTransaction = createTransaction(widget.data);
                                    });
                                  },
                                );

                              },
                            );*/

                                    },
                                    child: Align(
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Continue to WorldPay",
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
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )),
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
                        Text("is connecting to WorldPay.",
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
            _processTransactionResponse(context, _data); // Process the response
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



  String removeNonNumericCharacters(String input) {
    return input.replaceAll(RegExp(r'\D+'), '');
  }

  bool validateCreditCardNumber(String cardNumber) {
    String cleanedNumber = removeNonNumericCharacters(cardNumber);
    int sum = 0;
    bool isAlternateDigit = false;

    for (int i = cleanedNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cleanedNumber[i]);
      if (isAlternateDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      isAlternateDigit = !isAlternateDigit;
    }

    return sum % 10 == 0;
  }


  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
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
                          Text("is connecting to WorldPay.",
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

      var paymentInsts = await callPaymentInstructions("etornamasamoah@gmail.com", confirmationData.data!.transRef!);
      Navigator.pop(context);

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          TransactionCompleteScreen(data: confirmationData.data, image: "",)), (Route<dynamic> route) => false);


      await launchUrl(
        Uri.parse(paymentInsts.data!.r1TransPaymentUrl.toString()),
        mode: LaunchMode.externalApplication,);

      /*await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(paymentInsts.data!.r1TransPaymentUrl!.toString())),
        ),
      ));*/





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

}

