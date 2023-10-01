import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_email.dart';


import 'package:send_libra/constants.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Expanded(
                  flex: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Send",
                                style: TextStyle(
                                    fontSize: 75, fontWeight: FontWeight.w400),
                              ),
                              Text("money,",
                                  style: TextStyle(
                                      fontSize: 75, fontWeight: FontWeight.w400)),
                              Text("instantly",
                                  style: TextStyle(
                                      fontSize: 75,
                                      fontWeight: FontWeight.w600,
                                      color: libraLight)),
                              Text("and",
                                  style: TextStyle(
                                      fontSize: 75, fontWeight: FontWeight.w400)),
                              Text("securely!",
                                  style: TextStyle(
                                      fontSize: 75,
                                      fontWeight: FontWeight.w600,
                                      color: libraLight)),
                            ],
                          ),
                        ),
                      ],
                    ),
                   // color: Colors.blue,
                  )),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignUpEmailScreen()));
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
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
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
                //color: Colors.green,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
