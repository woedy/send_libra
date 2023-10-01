import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Legal/privacy_screen.dart';
import 'package:send_libra/Screens/Legal/terms_conditions_screen.dart';
import 'package:send_libra/constants.dart';

class LegalScreen extends StatefulWidget {
  const LegalScreen({Key? key}) : super(key: key);

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
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
                Column(
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "Legal",
                            style: TextStyle(fontSize: 75,  ),

                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PrivacyPolicyScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Data Protection & Privacy Policy", style: TextStyle(fontSize: 20),),
                            Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TermsAndConditionsScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Terms & Conditions", style: TextStyle(fontSize: 20),),
                            Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
