
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info2.dart';
import 'package:send_libra/constants.dart';

class SignUpUserInfoScreen extends StatefulWidget {
  final data;
  const SignUpUserInfoScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpUserInfoScreen> createState() => _SignUpUserInfoScreenState();
}

class _SignUpUserInfoScreenState extends State<SignUpUserInfoScreen> {
  TextEditingController controller = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String? first_name;
  String? last_name;


  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;


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
                        height: 30,
                      ),

                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Let’s get you\nstarted", style: TextStyle(fontSize: 36),),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("First Name on ID", style: TextStyle(fontSize: 12),),
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
                                        labelText: "First Name",
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
                                          return 'First Name is required';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          first_name = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Last Name on ID", style: TextStyle(fontSize: 12),),
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
                                        labelText: "Last Name",
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
                                          return 'Last Name is required';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          last_name = value;
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

                              widget.data['first_name'] = first_name;
                              widget.data['last_name'] = last_name;

                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserInfo2Screen(data: widget.data)));

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

