import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/About/about_screen.dart';
import 'package:send_libra/Screens/AddBankCard/add_bank_card.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Legal/legal_screen.dart';
import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_user_info.dart';

import 'package:send_libra/Screens/UserProfile/models/user_profile_model.dart';
import 'package:send_libra/Screens/UserProfile/profile_screen.dart';
import 'package:send_libra/Screens/UserProfile/verification_status.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



Future<UserProfileModel> getUserProfile(String email, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/profile/user"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "email": await getUserIDPref(),
      "token": await getApiPref(),
    }),
  );

  if (response.statusCode == 200) {

    return UserProfileModel.fromJson(jsonDecode(response.body));

  } else if (response.statusCode == 422) {
    return UserProfileModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Sign In');
  }
}


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with SingleTickerProviderStateMixin   {

  Future<UserProfileModel>? _futureUserProfile;
  AnimationController? _controller;


  @override
  void initState() {
    super.initState();
    _futureUserProfile = getUserProfile("email", "token");

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();

  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return (_futureUserProfile == null) ? buildColumn() : buildFutureBuilder();


  }

  buildColumn() {

    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }

  FutureBuilder<UserProfileModel> buildFutureBuilder() {
    return FutureBuilder<UserProfileModel>(
        future: _futureUserProfile,
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
                        Text("is loading profile..",
                          style: TextStyle(fontSize: 30, color: libraPrimary),
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
            return SizedBox();
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;



            if(data.message == "User profile retrieved successfully") {


              return Scaffold(
                body: SafeArea(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                            SizedBox(
                              height: 10,
                            ),

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
                                                builder: (context) => UserProfileScreen(data: data.data),
                                              ));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/user_profile_icon.png'))),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("My Profile", style: TextStyle(color: libraPrimary,fontSize: 12),),


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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VerificationStatusScreen(data: data.data)));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/status.png'))),                                          SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Verification Status", style: TextStyle(color: libraPrimary,fontSize: 12),),


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
                                            UpdateUserInfoScreen(data: data.data,)));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/idcard.png'))),                                          SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Upload ID/ Update Account", style: TextStyle(color: libraPrimary,fontSize: 12),),


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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddBankCardScreen()));
                                              },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/bank.png'))),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Manage Bank Cards", style: TextStyle(color: libraPrimary,fontSize: 12),),


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
                                  child: Text("Legal & About Libra"),
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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LegalScreen()));

                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/legal.png'))),                                        SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("Legal", style: TextStyle(color: libraPrimary,fontSize: 12),),


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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AboutScreen()));

                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 21,
                                                        child: Image(image: AssetImage('assets/icons/about.png'))),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text("About Libra", style: TextStyle(color: libraPrimary,fontSize: 12),),


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


                                              clearApiKey();

                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(builder: (context) => SignInScreen()),
                                                    (route) => false,
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
                        ),
                      ),
                    ),
                  ),
                ),
              );

            }

          }

          //rikivaj654@pyadu.com

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")*/
                ],
              ),
            ),
          );


        }
    );
  }




  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("quickSendList");
    await prefs.remove("USER_ID");
  }




}
