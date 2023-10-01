import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Libra',
        theme: theme(),
        home: MyHomePage(),
      ),
    );
  }
}

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

          /*return CreditCardInfoScreen(
            data: {},
            transaction_type: "mobile",
            beneficiary_id: "uiy8868787",
            fname: "null",
            lname: "",
            phone: "", avatar: "",

          );*/
          //return SignUpVerification(email: "fafaetornam@gmail.com", reg_data: {}, verify_state: 'Register',);
          return api_key == null ? SplashScreen() : HomeScreen();
          //return SignUpUserInfo2Screen(data: {},);

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }
}
