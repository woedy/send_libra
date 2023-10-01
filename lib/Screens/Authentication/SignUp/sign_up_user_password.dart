import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignIn/models/sign_in_model.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_email.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_verification.dart';
import 'package:send_libra/constants.dart';


Future<SignInModel> loginUser(data) async {
  final response = await http.post(
    Uri.parse('https://libra.teamalfy.co.uk/api/v1/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    // If the server returned a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));

    return SignInModel.fromJson(jsonDecode(response.body));

  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));

  }else if (response.statusCode == 400) {
    print(jsonDecode(response.body));
    return SignInModel.fromJson(jsonDecode(response.body));
  }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    print(jsonDecode(response.body));


    throw Exception('Failed to login.');
  }
}



class SignUpUserInfoPassword extends StatefulWidget {
  final data;
  const SignUpUserInfoPassword({required this.data, Key? key}) : super(key: key);

  @override
  State<SignUpUserInfoPassword> createState() => _SignUpUserInfoPasswordState();
}

class _SignUpUserInfoPasswordState extends State<SignUpUserInfoPassword> with SingleTickerProviderStateMixin  {
  //final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  Future<SignInModel>? _futureUser;

  AnimationController? _controller;
  final _formKey = GlobalKey<FormState>();


  String? password;
  String? password_confirmation;

  var show_password = false;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  /* void _login() {
    setState(() {
      _futureUser = loginUser(
        email!,
        password!,
      );
    });
  }
*/

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
        child: (_futureUser == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
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
                Expanded(
                  flex: Platform.isAndroid ? 3 : 3,
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
                              Text("Add a strong\npassword", style: TextStyle(fontSize: 36),),
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
                                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*])')
                                            .hasMatch(value)) {

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character"),
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
                                ],
                              ),


                              Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character", style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                height: 50,
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

                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          KeyboardUtil.hideKeyboard(context);
                                          //_futureSignIn = signInUser(email!, password!);

                                          var validation = validatePassword(password!, password_confirmation!);

                                          if (validation == "Passwords do not match!"){
                                            //return;

                                          }else{
                                            widget.data['password'] = password;
                                            widget.data['password_confirmation'] = password_confirmation;

                                            widget.data['source_country_id'] = "01";

                                            //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserInfoPassword(data: widget.data)));

                                            _futureUser = loginUser(widget.data);


                                          }
                                        }

                                      },
                                      child: Align(
                                        child: Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Sign Up",
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
                              )

                            ],
                          ),
                        ),
                      )
                    ],
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
      future: _futureUser,
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
                      Text("is setting up your account",
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

          if(data.message == "Account creation is pending verification. Please check your email for the verification code.") {



            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpVerification(email: widget.data['email'], reg_data: widget.data, verify_state: "Register",)),
                      (route) => false,
                );
              });

            });

            //return const SizedBox();
          }
          else if(data.message == "VALIDATION FAILED") {
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
                                      Text("User already exist.",
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

            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpEmailScreen()),
                      (route) => false,
                );
              });

            });

           // return const SizedBox();
          }
          else if(data.message == "The Remitter Email provided has already been used, please enter a different value") {
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
                                      Text("User already exist.",
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

            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpEmailScreen()),
                      (route) => false,
                );
              });

            });

            // return const SizedBox();
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
                                    Text("Failed to Register",
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
            setState(() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignUpEmailScreen()),
                    (route) => false,
              );
            });

          });

         // return const SizedBox();

          //taciyet139@anomgo.com


        }

        return const SizedBox();
      },
    );
  }


  validatePassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      Fluttertoast.showToast(
        msg: "Passwords do not match!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

      return "Passwords do not match!";
    }
  }

}

