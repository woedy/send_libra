import 'package:flutter/material.dart';

import 'Screens/SendMoney/send_money_dialog_box1.dart';

class QuickTest extends StatefulWidget {
  const QuickTest({Key? key}) : super(key: key);

  @override
  State<QuickTest> createState() => _QuickTestState();
}

class _QuickTestState extends State<QuickTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {


              showDialog(
                context: context,
                builder: (context) => LoadingVerificationDialog1(
                  amount: 100,
                  full_name: "John Doe",
                  mobile: "123-456-7890",
                  onCountdownComplete: () {
                    print("Countdown complete.");
                  },
                ),
              );
            },
            child: Text("Open Dialog"),
          ),
        ),
      ),
    );
  }
}
