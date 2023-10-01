import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info.dart';
import 'package:send_libra/constants.dart';


class SignUpEmailScreen extends StatefulWidget {

  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {

  final _formKey = GlobalKey<FormState>();

  String? email;

  @override
  Widget build(BuildContext context) {

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
                              text: "Sign Up",
                              style: TextStyle(fontSize: 75,  ),

                            )
                        ),
                      ),
                      SizedBox(
                        height: 20
                      ),
                      Container(

                          child:  Form(
                            key: _formKey,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Let’s get you\nstarted", style: TextStyle(fontSize: 36),),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text("Enter your Email", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 30,
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
                                        labelText: "Email",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email is required';
                                        }
                                        if (value.length < 3) {
                                          return 'Name too short';
                                        }
                                        String pattern =
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                            r"{0,253}[a-zA-Z0-9])?)*$";
                                        RegExp regex = RegExp(pattern);
                                        if (!regex.hasMatch(value))
                                          return 'Enter a valid email address';

                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                    ),
                                  ),

                                  SizedBox(
                                    height: 30,
                                  ),


                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),


                Align(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SignInScreen()));
                    },
                    child: Text.rich(TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: "Sign In here",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  ),
                ),


                Expanded(
                  //flex: 1,
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



                            var _data = {
                              "email": email
                            };

                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserInfoScreen(data: _data)));

                          }

                        },
                        child: Align(
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Next",
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






}
