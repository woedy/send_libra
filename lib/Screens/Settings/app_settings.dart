import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/Password/forget_password.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
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
                          child: Text("Security"),
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
                              Opacity(
                                opacity: 0.4,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                    /*    Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => UserProfileScreen(data: data.data),
                                        ));*/
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  height: 21,
                                                  child: Image(image: AssetImage('assets/icons/finger.png'))),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("Use fingerprint/Face ID", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                            ],

                                          ),

                                          Opacity(
                                            opacity: 0.3,
                                            child: CupertinoSwitch(

                                              activeColor: libraPrimary,


                                              value: true,
                                              onChanged: (bool value) {

                                            },),
                                          )


                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: 0.4,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
/*
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VerificationStatusScreen(data: data.data)));
*/
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  height: 21,
                                                  child: Image(image: AssetImage('assets/icons/lock.png'))),                                          SizedBox(
                                                width: 20,
                                              ),
                                              Text("Use Passcode", style: TextStyle(color: libraPrimary,fontSize: 12),),


                                            ],

                                          ),
                                          Opacity(
                                            opacity: 0.3,
                                            child: CupertinoSwitch(

                                              activeColor: libraPrimary,


                                              value: true,
                                              onChanged: (bool value) {

                                              },),
                                          )


                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ForgotPassword()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                height: 21,
                                                child: Image(image: AssetImage('assets/icons/paswordd.png'))),                                          SizedBox(
                                              width: 20,
                                            ),
                                            Text("Change Password", style: TextStyle(color: libraPrimary,fontSize: 12),),


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

