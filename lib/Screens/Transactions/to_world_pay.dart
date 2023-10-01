import 'package:flutter/material.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/constants.dart';

class ToWorldPay extends StatefulWidget {
  const ToWorldPay({Key? key}) : super(key: key);

  @override
  State<ToWorldPay> createState() => _ToWorldPayState();
}

class _ToWorldPayState extends State<ToWorldPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Image(
                          image: AssetImage("assets/images/libra-small.png"),
                        )),
                  ],
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Transaction is being processed by worldpay. Tap to go dashboard.", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
                      SizedBox(
                        height: 30,
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
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                      (route) => false,
                                );
                              },
                              child: Align(
                                child: Container(

                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Go To Dashboard",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 20,
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
              ],
            ),

          ),
        ),
      ),
    );
  }
}
