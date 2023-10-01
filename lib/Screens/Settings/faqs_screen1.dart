import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Settings/faqs_fee_charges.dart';
import 'package:send_libra/Screens/Settings/faqs_general.dart';
import 'package:send_libra/Screens/Settings/faqs_money_transfer.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FAQScreen1 extends StatefulWidget {
  const FAQScreen1({Key? key}) : super(key: key);

  @override
  State<FAQScreen1> createState() => _FAQScreen1State();
}

class _FAQScreen1State extends State<FAQScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            //height: MediaQuery.of(context).size.height,

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
                            text: "FAQs",
                            style: TextStyle(fontSize: 75,  ),

                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("We want to make sure you know everything you need to know about our services, so here’s our guide to some of the most common questions and best ways to solve them."),
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQGeneral()));

                              },
                              child: ListTile(
                                title: Text("General Questions", style: TextStyle(color: Colors.white, fontSize: 25,),),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQMoneyTransfer()));

                              },
                              child: ListTile(
                                title: Text("Money Transfer", style: TextStyle(color: Colors.white, fontSize: 25,),),
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQFeeAndCharges()));

                              },
                              child: ListTile(
                                title: Text("Fees And Charges", style: TextStyle(color: Colors.white, fontSize: 25,),),
                              ),
                            ),

                          ],
                        )

                      ],
                    ),



                  ],
                )






              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("quickSendList");
    await prefs.remove("USER_ID");
  }


}

