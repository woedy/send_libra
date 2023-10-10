import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_resend_verification.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info2.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/transaction_complate_screen.dart';


import 'package:send_libra/Screens/SplashScreen/splash_screen.dart';

import 'package:send_libra/constants.dart';
import 'package:send_libra/test_home.dart';

import 'Components/theme.dart';
import 'Screens/Authentication/SignUp/sign_up_verification.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/SendMoney/SendNormal/BankTransfer/bank_transfer_screen.dart';
import 'Screens/SendMoney/SendNormal/Card/credit_card_info_screen.dart';
import 'playground2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp.router(routerConfig: router,),
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(path: '/',
  builder: (_,__)=> Scaffold(
    appBar: AppBar(title: Text("Dashboard"),),
  ),
    routes: [
      GoRoute(path: 'profile',
      builder: (_,__)=>Scaffold(
        appBar: AppBar(title: const Text("Profile"),),
      ))
    ]

  ),


]);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? api_key = "";
  Future? _user_api;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          return api_key == null ? SplashScreen() : HomeScreen();

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }
}
