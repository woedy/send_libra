import 'package:flutter/material.dart';
import 'package:send_libra/Components/pop_transition.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_gender_2.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/constants.dart';

class EditProfileIntro extends StatefulWidget {
  final reg_data;
  const EditProfileIntro({Key? key, required this.reg_data}) : super(key: key);

  @override
  State<EditProfileIntro> createState() => _EditProfileIntroState();
}

class _EditProfileIntroState extends State<EditProfileIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Container(
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
                      ),
                      Container(
                        child: Image.asset("assets/images/ed_back1.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text("Hey There " + widget.reg_data['first_name'].toString() + ",", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),),
                            SizedBox(
                              height: 15,
                            ),
                            Text("before you start sending money all around the world, we need you to fill us in a bit more. Just a few easy-peasy steps, promise! ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0), textAlign: TextAlign.center, ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
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

                                var profile_data = {};

                                Navigator.push(
                                  context,
                                  PopTransition(page: EditProfileGender(reg_data: widget.reg_data, profile_data: profile_data,)),
                                );



                                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditProfileGender(reg_data: widget.reg_data, profile_data: profile_data,)));

                              },
                              child: Align(
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Okay lets go!",
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
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: 384,
                          height: 55,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              //color: libraBlue,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {

                                var profile_data = {};

                                Navigator.push(
                                  context,
                                  PopTransition(page: HomeScreen()),
                                );



                                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditProfileGender(reg_data: widget.reg_data, profile_data: profile_data,)));

                              },
                              child: Align(
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Skip and go to dashboard",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
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
                  )),
           



            ],
          ),
        ),
      ),
    );
  }
}
