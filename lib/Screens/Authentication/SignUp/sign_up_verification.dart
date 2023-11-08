import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_1.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_email.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_resend_verification.dart';
import 'package:send_libra/constants.dart';

import 'models/verify_email_model.dart';



Future<VerifyEmailModel> verifyEmail(email, code) async {

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/verify-email"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
      "code": code,
    }),
  );

  if (response.statusCode == 201) {

    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {

    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Verify');
  }
}




class SignUpVerification extends StatefulWidget {
  final email;
  final reg_data;
  final String verify_state;
  const SignUpVerification({Key? key, required this. email, required this.reg_data, required this.verify_state}) : super(key: key);

  @override
  State<SignUpVerification> createState() => _SignUpVerificationState();
}

class _SignUpVerificationState extends State<SignUpVerification>  with SingleTickerProviderStateMixin {
  Future<VerifyEmailModel>? _futureVerifyEmail;

  AnimationController? _controller;
  List<FocusNode>? _focusNodes;

  TextEditingController controller = TextEditingController(text: "");
  bool hasError = false;
  String email_token = "";



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

    for (var focusNode in _focusNodes!) {
      focusNode.dispose();
    }
    super.dispose();
  }






  @override
  Widget build(BuildContext context) {



    return (_futureVerifyEmail == null) ? buildColumn() : buildFutureBuilder();



  }


  buildColumn() {
    //Navigator.pop(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: Platform.isAndroid ? 3 : 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Image(image: AssetImage("assets/images/libra-small.png"),)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text.rich(
                            TextSpan(
                              text: "Verify Email",
                              style: TextStyle(fontSize: 55,  ),

                            )
                        ),
                      ),

                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text("Enter your verification code", style: TextStyle(fontSize: 36),),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(widget.verify_state == "Register")...[
                                    Text("Account creation is pending verification. Please check your email for the verification code.", style: TextStyle(fontSize: 18, color: Colors.green), textAlign: TextAlign.left,),
                                  ]else if(widget.verify_state == "Resend")...[
                                    Text("A fresh token has been resent to your email. Please check and enter here.", style: TextStyle(fontSize: 18, color: Colors.green), textAlign: TextAlign.left,),
                                  ]else if(widget.verify_state == "Wrong")...[
                                    Text("Invalid code. Please enter the correct verification code from your email here.", style: TextStyle(fontSize: 18, color: Colors.red), textAlign: TextAlign.left,),
                                  ],
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("Enter verification code here.", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PinCodeTextField(
                                        autofocus: true,
                                        controller: controller,
                                        hideCharacter: false,
                                        highlight: true,
                                        highlightColor: Colors.red,
                                        defaultBorderColor:
                                        Colors.grey.withOpacity(0.3),
                                        hasTextBorderColor:
                                        Colors.grey.withOpacity(0.2),
                                        highlightPinBoxColor: Colors.transparent,
                                        pinBoxColor: Colors.transparent,
                                        pinBoxRadius: 10,
                                        keyboardType: TextInputType.text,
                                        maxLength: 4,
                                        //maskCharacter: "😎",
                                        onTextChanged: (text) {
                                          setState(() {
                                            hasError = false;
                                          });
                                        },
                                        onDone: (text) {
                                          print("DONE $text");
                                          print("DONE CONTROLLER ${controller.text}");
                                          email_token=text.toString();
                                        },
                                        pinBoxWidth: 80,
                                        pinBoxHeight: 80,
                                        //hasUnderline: true,
                                        wrapAlignment: WrapAlignment.spaceAround,
                                        pinBoxDecoration: ProvidedPinBoxDecoration
                                            .defaultPinBoxDecoration,
                                        pinTextStyle: TextStyle(fontSize: 35.0),
                                        pinTextAnimatedSwitcherTransition:
                                        ProvidedPinBoxTextAnimation
                                            .scalingTransition,
                                        pinTextAnimatedSwitcherDuration:
                                        Duration(milliseconds: 300),
                                        highlightAnimationBeginColor: Colors.black,
                                        highlightAnimationEndColor: Colors.white12,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),

                                  InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ResendVerification(email: widget.email, reg_data: widget.reg_data,)));

                                      },
                                      child: Text("Resend email verification", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)),

                                ],
                              ),



                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                if(email_token != "")...[
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





                              KeyboardUtil.hideKeyboard(context);
                                setState(() {
                              _futureVerifyEmail = verifyEmail(widget.email, email_token.toString());
                                });

                            },
                            child: Align(
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Verify",
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
                ]




              ],
            ),
          ),
        ),
      ),
    );
  }

  //647eaa520cc53

  FutureBuilder<VerifyEmailModel> buildFutureBuilder() {
    return FutureBuilder<VerifyEmailModel>(
        future: _futureVerifyEmail,
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
                        Text("is confirming your verification code",
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




            if(data.message == "Email verification successful. You can proceed to login.") {

              saveIDApiKey(data.data!.token.toString());
              saveUSER_ID(widget.reg_data['email']);

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
                                Image(image: AssetImage("assets/images/sprinkles.png")),
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
                                        Text("Email verification successful.",
                                          style: TextStyle(fontSize: 27, color: libraPrimary),
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

              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileIntro(reg_data: widget.reg_data,)),
                      (route) => false,
                );
              });


            }else {


         /*     WidgetsBinding.instance.addPostFrameCallback((_) {
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
*/

              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpVerification(email: widget.email, reg_data: widget.reg_data, verify_state: "Wrong",)),
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

