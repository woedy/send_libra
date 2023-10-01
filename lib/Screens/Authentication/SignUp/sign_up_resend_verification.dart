import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';


import 'package:http/http.dart' as http;
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_verification.dart';
import 'package:send_libra/constants.dart';

import 'models/verify_email_model.dart';



Future<VerifyEmailModel> verifyEmail(email, code) async {

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/email/verification-notification"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": email,
      "code": code,
    }),
  );

  if (response.statusCode == 200) {

    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Verify');
  }
}



class ResendVerification extends StatefulWidget {
  final email;
  final reg_data;
  const ResendVerification({Key? key, required this.email, required this.reg_data}) : super(key: key);

  @override
  State<ResendVerification> createState() => _ResendVerificationState();
}

class _ResendVerificationState extends State<ResendVerification>  with SingleTickerProviderStateMixin {
  Future<VerifyEmailModel>? _futureVerifyEmail;

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



    return (_futureVerifyEmail == null) ? buildColumn() : buildFutureBuilder();



  }


  buildColumn() {
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text.rich(
                            TextSpan(
                              text: "Verify Email",
                              style: TextStyle(fontSize: 55,  ),

                            )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Resend Verification code to", style: TextStyle(fontSize: 26),),
                              SizedBox(
                                height: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text("Enter verification code here.", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.1))),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Username/Email',

                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                        //labelText: "Verification code",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.email,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      enabled: false,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Verification code is required';
                                        }
                                        if (value.length < 3) {
                                          return 'Verification code too short';
                                        }

                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          code = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),


                                ],
                              ),



                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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

                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              KeyboardUtil.hideKeyboard(context);
                              _futureVerifyEmail = verifyEmail(widget.email, code!);
                            }

                          },
                          child: Align(
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Resend Verification",
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

  //647832bdd6a6e

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
                        Text("is sending code.",
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
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;



            if(data.message == "A fresh token has been resent to your email") {

           /*   WidgetsBinding.instance.addPostFrameCallback((_) {
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
                                    height: 280,

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

*/
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpVerification(email: widget.email, reg_data: widget.reg_data, verify_state: "Resend",)),
                      (route) => false,
                );
              });

              return const SizedBox();


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

              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ResendVerification(email: widget.email, reg_data: widget.reg_data,)),
                      (route) => false,
                );
              });

              return const SizedBox();

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

//647832bdd6a6e

