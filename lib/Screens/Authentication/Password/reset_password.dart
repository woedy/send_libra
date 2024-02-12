import 'dart:convert';
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignIn/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SignInModel> reset_password(data) async {

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/reset-password"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(response.statusCode.toString());
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load');
  }
}


class ResetPassword extends StatefulWidget {
  final email;
  const ResetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  AnimationController? _controller;

  String? password;
  String? password_confirmation;
  String? code;

  var show_password = false;


  Future<SignInModel>? _futureResetPassword;


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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureResetPassword == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }



  Widget buildColumn() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            //height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Expanded(
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
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text.rich(
                              TextSpan(
                                text: "Password",
                                style: TextStyle(fontSize: 60,  ),

                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lets help you reset your password", style: TextStyle(fontSize: 36),),
                                SizedBox(
                                  height: 20,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Password", style: TextStyle(fontSize: 12),),
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
                                          //hintText: 'Enter Password',
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  show_password = !show_password;
                                                });
                                              },
                                              icon: Icon(
                                                show_password
                                                    ? Icons.remove_red_eye_outlined
                                                    : Icons.remove_red_eye,
                                                color: Colors.white,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                            labelText: "Password",
                                            labelStyle:
                                            TextStyle(fontSize: 13, color: bodyText2),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: libraPrimary)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: libraPrimary)),
                                            border: InputBorder.none),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),
                                        ],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#\$%^&*_()\-+=/.,<>?"~`£{}|:;])')
                                              .hasMatch(value)) {

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                            return '';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        textInputAction: TextInputAction.next,
                                        obscureText: show_password ? false : true,
                                        onSaved: (value) {
                                          setState(() {
                                            password = value;
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
                                    Text("Re-Enter Password", style: TextStyle(fontSize: 12),),
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
                                          //hintText: 'Enter Password',
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  show_password = !show_password;
                                                });
                                              },
                                              icon: Icon(
                                                show_password
                                                    ? Icons.remove_red_eye_outlined
                                                    : Icons.remove_red_eye,
                                                color: Colors.white,
                                              ),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                            labelText: "Re-Enter Password",
                                            labelStyle:
                                            TextStyle(fontSize: 13, color: bodyText2),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: libraPrimary)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: libraPrimary)),
                                            border: InputBorder.none),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),
                                        ],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value != password) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            password_confirmation = value;
                                          });
                                        },
                                        textInputAction: TextInputAction.next,
                                        obscureText: show_password ? false : true,
                                        onSaved: (value) {
                                          setState(() {
                                            password_confirmation = value;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),


                                    Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character", style: TextStyle(color: Colors.grey)),
                                    SizedBox(
                                      height: 30,
                                    ),

                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Reset Code", style: TextStyle(fontSize: 12),),
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
                                          labelText: "Code",
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
                                            return 'Code is required';
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
                                onTap: () async{

                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    KeyboardUtil.hideKeyboard(context);
                                    //_futureSignIn = signInUser(email!, password!);

                                    var data = {
                                      "email": widget.email,
                                      "password": password,
                                      "password_confirmation":password_confirmation,
                                      "code": code
                                    };

                                    _futureResetPassword = reset_password(data);
                                  }

                                },
                                child: Align(
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Reset Password",
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
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }


  FutureBuilder<SignInModel> buildFutureBuilder() {
    return FutureBuilder<SignInModel>(
      future: _futureResetPassword,
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
                      Text("is resetting password",
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
//647eac5522340

              )

          );
        } else if (snapshot.hasData) {
          var data = snapshot.data!;

          if(data.message == "Password reset successfully. Proceed to login") {
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
              clearApiKey();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false,
              );
            });

            return const SizedBox();
          }


        } else if (snapshot.hasError) {




          WidgetsBinding.instance!.addPostFrameCallback((_) {
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
                                    Text("Failed to Reset",
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

          /*  Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignUpUserInfoPassword()),
                  (route) => false,
            );
          });*/

          return const SizedBox();




        }

        return const SizedBox();
      },
    );
  }


  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
  }

  bool isDateBeforeToday(String inputDate) {
    DateTime currentDate = DateTime.now();
    DateTime date = DateTime.parse(inputDate);

    // Extract only the date part from the input date
    DateTime inputDateOnly = DateTime(date.year, date.month, date.day);

    // Extract only the date part from the current date
    DateTime currentDateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Check if the input date is before today
    if (inputDateOnly.isBefore(currentDateOnly)) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("quickSendList");
    await prefs.remove("USER_ID");
  }



}
