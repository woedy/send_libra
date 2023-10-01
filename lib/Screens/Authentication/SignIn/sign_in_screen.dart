import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/Password/forget_password.dart';
import 'package:send_libra/Screens/Authentication/SignIn/models/sign_in_model.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_email.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<SignInModel> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://libra.teamalfy.co.uk/api/v1/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server returned a 200 OK response,
    // then parse the JSON.

    await saveUSER_ID(email);
    final result = json.decode(response.body);
    if (result != null) {

      await saveIDApiKey(result['data']['token'].toString());
    }
    return SignInModel.fromJson(jsonDecode(response.body));

  } else if (response.statusCode == 422) {

    return SignInModel.fromJson(jsonDecode(response.body));
  }else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to login.');
  }
}


Future<bool> saveIDApiKey(String apiKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("API_Key", apiKey);
  return prefs.commit();
}

Future<bool> saveUSER_ID(String userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("USER_ID", userId.toString());
  return prefs.commit();
}

void save_user_data(data) async {
  await saveIDApiKey(data.data!.token.toString());
  await saveUSER_ID(data.data!.id!.toString());
}


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin  {
  //final TextEditingController _emailController = TextEditingController();
 // final TextEditingController _passwordController = TextEditingController();
  Future<SignInModel>? _futureUser;

  AnimationController? _controller;
  final _formKey = GlobalKey<FormState>();


  String? email;
  String? password;

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
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: Row(
                      children: [
                        Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            child: Image(
                              image: AssetImage("assets/images/libra-small.png"),
                            )),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            fontSize: 75,
                          ),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
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
                                    if (value.length < 5) {
                                      return 'Password too short';
                                    }
                                    return null;
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

                                    setState(() {
                                      _futureUser = loginUser(
                                        email!,
                                        password!,
                                      );
                                    });
                                  }

                                },
                                child: Align(
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Sign In",
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
                          height: 30,
                        ),
                        Align(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
                            },
                            child: Text.rich(TextSpan(
                                text: "Forgot password? ",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: "Click here to recover",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            Text("or"),
                            SizedBox(
                              width: 170,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                   /*     SizedBox(
                          height: 30,
                        ),
                        Align(
                          child: Container(
                            width: 384,
                            height: 55,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.1))),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Image(
                                            image: AssetImage(
                                              'assets/icons/googlee.png',
                                            )),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          "Sign in with google",
                                          style: TextStyle(
                                              fontSize: 15, color: libraPrimary),
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
                          height: 30,
                        ),
                        Align(
                          child: Container(
                            width: 384,
                            height: 55,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: libraLight,
                                borderRadius: BorderRadius.circular(15)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Align(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Image(
                                            image: AssetImage(
                                              'assets/icons/applee.png',
                                            )),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          "Sign in with apple",
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
                          height: 30,
                        ),*/
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpEmailScreen()));
                            },
                            child: Text.rich(TextSpan(
                                text: "Don’t have an account? ",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: "Sign Up here",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),
                        ),
                      ],
                    ),
                  )
              ),

            ],
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
                      Text("Connecting..",
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
        } else if (snapshot.hasData) {
          var data = snapshot.data!;

          if(data.message == "User authenticated successfully") {
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

            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
              );
            });

            return const SizedBox();
          }

          else if (data.message == "The email field must be a valid email address.") {
            String? errorKey = snapshot.data!.errors!.keys.firstWhere(
                  (key) => key == "password" || key == "email",
              orElse: () => null!,
            );
            if (errorKey != null) {
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
            }

          }
          else if (data.message == "User authentication failed") {
            String? errorKey = snapshot.data!.errors!.keys.firstWhere(
                  (key) => key == "password" || key == "email",
              orElse: () => null!,
            );
            if (errorKey != null) {
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
                                        Text("Invalid Email or Password",
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
            }

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
                                      Text("Invalid Email or Password",
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                    (route) => false,
              );
            });

            return const SizedBox();




        }

        return const SizedBox();
      },
    );
  }




}

