import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Legal/privacy_screen.dart';
import 'package:send_libra/Screens/Legal/terms_conditions_screen.dart';
import 'package:send_libra/Screens/Settings/app_settings.dart';
import 'package:send_libra/Screens/Settings/contact_us.dart';
import 'package:send_libra/Screens/Settings/faqs_screen1.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                            text: "Settings",
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
                          child: Text("My Account"),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => AppSettingsScreen(),
                                      ));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/app_settings.png'))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("App settings", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQScreen1()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/faqs.png'))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("FAQs", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                              Column(
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
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/privacy_p.png'))),                                          SizedBox(
                                              width: 20,
                                            ),
                                            Text("Privacy Policy", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TermsAndConditionsScreen()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/terms_2.png'))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("Terms & Conditions", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ContactUsScreen()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/contact_us.png'))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("Contact Us", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),


                                ],
                              ),


                            ],
                          ),
                        )
                      ],
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Sign Out"),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){


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
                                                          height: 280,

                                                          padding: EdgeInsets.all(20),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Image(image: AssetImage("assets/images/libra-dialog.png")),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Text("are you sure you want to logout?",
                                                                style: TextStyle(fontSize: 30, color: libraPrimary),
                                                              ),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Align(
                                                                    child: Container(
                                                                      width: 80,
                                                                      padding: EdgeInsets.all(15),
                                                                      decoration: BoxDecoration(
                                                                          color: libraBlue,
                                                                          borderRadius: BorderRadius.circular(15)),
                                                                      child: Material(
                                                                        color: Colors.transparent,
                                                                        child: InkWell(
                                                                          onTap: () {
                                                                            Navigator.of(context).pop();


                                                                          },
                                                                          child: Align(
                                                                            child: Container(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    "No",
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
                                                                  Align(
                                                                    child: Container(

                                                                      padding: EdgeInsets.all(15),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.red,
                                                                          borderRadius: BorderRadius.circular(15)),
                                                                      child: Material(
                                                                        color: Colors.transparent,
                                                                        child: InkWell(
                                                                          onTap: () {


                                                                            clearApiKey();

                                                                            Navigator.pushAndRemoveUntil(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => SignInScreen()),
                                                                                  (route) => false,
                                                                            );


                                                                          },
                                                                          child: Align(
                                                                            child: Container(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    "Yes logout",
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
                                                            ],
                                                          )


                                                      ),
                                                    ],
                                                  ),
                                                )

                                            );
                                          }
                                      );

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/logout.png'))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("Logout", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                          ],

                                        ),
                                        Icon(Icons.arrow_forward_ios),


                                      ],
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
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

