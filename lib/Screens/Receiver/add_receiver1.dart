import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info.dart';
import 'package:send_libra/Screens/Receiver/add_receiver_get_paid.dart';
import 'package:send_libra/constants.dart';


class AddReceiver1 extends StatefulWidget {

  const AddReceiver1({Key? key}) : super(key: key);

  @override
  State<AddReceiver1> createState() => _AddReceiver1State();
}

class _AddReceiver1State extends State<AddReceiver1> {

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? phone;

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
                  child: SingleChildScrollView(
                    child
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text.rich(
                              TextSpan(
                                text: "Beneficiary",
                                style: TextStyle(fontSize: 60,  ),

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
                                Text("Let’s help get\nyour beneficiary ", style: TextStyle(fontSize: 36),),
                                SizedBox(
                                  height: 30,
                                ),
                                Text("Enter Beneficiary Email", style: TextStyle(fontSize: 12),),
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

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Phone Number", style: TextStyle(fontSize: 12),),
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
                                          labelText: "Ex. +447373838388",
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
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Phone number is required';
                                          }

                                          bool isValid = validatePhoneNumber(value);

                                          if (isValid) {
                                            print("THE NUMBER IS VALID");
                                          } else {
                                            return "international format required. Eg.+447373838388.";
                                          }

                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: false,
                                        onSaved: (value) {
                                          setState(() {
                                            phone = value;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 30,
                                ),




                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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

                            var data = {
                              "email": email,
                              "mobile": phone,
                            };




                           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverGetPaidScreen(data: data)));

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

  bool validatePhoneNumber(String phoneNumber) {
    // Regular expression for international phone number validation
    final RegExp regex = RegExp(r'^\+\d{12}$');

    return regex.hasMatch(phoneNumber);
  }





}
