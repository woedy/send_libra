

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';

import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_user_info.dart';
import 'package:send_libra/Screens/UserProfile/models/user_profile_model.dart';
import 'package:send_libra/Screens/UserProfile/update_user_photo.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserProfileScreen extends StatefulWidget {
  final data;
  const UserProfileScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> with SingleTickerProviderStateMixin  {

  TextEditingController controller = TextEditingController(text: "");

  Future<UserProfileModel>? _futureUserProfile;
  AnimationController? _controller;

  String? phone;


  bool hasError = false;


  @override
  void initState() {
    super.initState();
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


    return buildColumn();
  }


  buildColumn() {




    Uint8List prof_bytes = base64Decode(widget.data!.avatarContent.trim().toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Container(
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              child: Image(image: AssetImage("assets/images/libra-small.png"),)),
                          */
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

                Center(
                  child: InkWell(
                      onTap: (){

                        if(((widget.data.address1 != "" && widget.data!.avatar!.isNotEmpty) || (widget.data.address1 != "" && widget.data!.avatar!.isEmpty)) && (widget.data.verified == 'f')) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Your status has to be valid before you can update your profile picture.'),
                            ),
                          );

                        }

                        else if((widget.data.address1 != "" && widget.data!.avatar!.isNotEmpty) || (widget.data.address1 != "" && widget.data!.avatar!.isEmpty)) {

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UpdateUserPhotoScreen(data: widget.data!,)));

                        }else {


                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please update your profile info before changing your profile picture.'),
                            ),
                          );
                        }

/*
                        if(widget.data!.avatar!.isEmpty) {




                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please update your profile info before changing your profile picture.'),
                            ),
                          );

                        }else {

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UpdateUserPhotoScreen(data: widget.data!,)));

                        }*/




                      },
                    child: Column(
                      children: [
                        if (widget.data!.avatar!.isEmpty)...[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Icon(Icons.person, size: 30,),
                            ),
                          ),
                        ]else...[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: MemoryImage(prof_bytes)
                              )
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 20,
                        ),
                        Text(widget.data!.firstname! + " " + widget.data!.lastname!, style: TextStyle(fontSize: 20),),
                        Text("ID: " + widget.data!.remitterId! , style: TextStyle(fontSize: 20),),
                        Text("daily limit £10,000", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                             // _showPersonalModalBottomSheet(context, widget.data);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Personal Information", style: TextStyle(fontSize: 20, color: libraPrimary),),
                                InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              UpdateUserInfoScreen(data: widget.data,)));
                                    },
                                    child: Image(image: AssetImage("assets/icons/edit.png")))
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height - 199,
                            child: ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First name on ID *",
                                      style: TextStyle(fontSize: 12, color: libraPrimary),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        //color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: libraPrimary.withOpacity(0.1))
                                      ),
                                      child: TextFormField(

                                        style: TextStyle(color: libraPrimary),
                                        decoration: InputDecoration(
                                          //hintText: 'Enter Password',

                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontWeight: FontWeight.normal),
                                          //labelText: "Password",
                                          labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          border: InputBorder.none,),
                                        inputFormatters: [LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),],
                                        initialValue: widget.data.firstname.toString(),
                                        enabled: false,
                                        validator: (name) {
                                          if (name!.isEmpty) {
                                            return 'First name is required';
                                          }
                                          if (name.length < 3) {
                                            return 'First name too short';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: true,
                                        onSaved: (value) {

                                          setState(() {

                                          });



                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height:20,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Middle name on ID",
                                      style: TextStyle(fontSize: 12, color: libraPrimary),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        //color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: libraPrimary.withOpacity(0.1))
                                      ),
                                      child: TextFormField(

                                        style: TextStyle(color: libraPrimary),
                                        decoration: InputDecoration(
                                          //hintText: 'Enter Password',

                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontWeight: FontWeight.normal),
                                          //labelText: "Password",
                                          labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          border: InputBorder.none,),
                                        inputFormatters: [LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),],
                                        initialValue: widget.data.middlename.toString(),

                                        validator: (name) {
                                          if (name!.isEmpty) {
                                            return 'Middle name is required';
                                          }
                                          if (name.length < 3) {
                                            return 'Middle name too short';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: false,
                                        enabled: false,
                                        onSaved: (value) {

                                          setState(() {

                                          });



                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height:20,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Last name on ID *",
                                      style: TextStyle(fontSize: 12, color: libraPrimary),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        //color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: libraPrimary.withOpacity(0.1))
                                      ),
                                      child: TextFormField(

                                        style: TextStyle(color: libraPrimary),
                                        decoration: InputDecoration(
                                          //hintText: 'Enter Password',

                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontWeight: FontWeight.normal),
                                          //labelText: "Password",
                                          labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          border: InputBorder.none,),
                                        inputFormatters: [LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),],
                                        initialValue: widget.data.lastname.toString(),
                                        validator: (name) {
                                          if (name!.isEmpty) {
                                            return 'Last Name is required';
                                          }
                                          if (name.length < 3) {
                                            return 'Last Name too short';
                                          }
                                          return null;
                                        },
                                        textInputAction: TextInputAction.next,
                                        autofocus: true,
                                        enabled: false,
                                        onSaved: (value) {

                                          setState(() {

                                          });



                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height:10,
                                    ),
                                  ],
                                ),

                                Align(
                                  child: Container(
                                    width: 384,
                                    height: 55,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {

                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Remove Account From Libra', style: TextStyle(color: Colors.red),),
                                                content: Text('Are you sure you want to remove your account from Libra? This action cannot be undone.!'),
                                                actions: [

                                                  Align(
                                                    child: Container(

                                                      padding: EdgeInsets.all(10),
                                                      margin: EdgeInsets.symmetric(horizontal: 10),

                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius: BorderRadius.circular(15)),
                                                      child: Material(
                                                        color: Colors.transparent,
                                                        child: InkWell(
                                                          onTap: () {


                                                            sendEmail();


                                                          },
                                                          child: Align(
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                    "Yes Remove Account",
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
                                                          color: Colors.transparent,
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
                                                                    "No Go Back",
                                                                    style: TextStyle(
                                                                        fontSize: 15, color: libraPrimary),
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
                                              );
                                            },
                                          );

                                        },
                                        child: Align(
                                          child: Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Remove Account",
                                                  style: TextStyle(
                                                      fontSize: 15, color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )


                              ],
                            ),
                          ),
                        ],
                      ),
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

  bool validatePhoneNumber(String phoneNumber) {
    // Regular expression for international phone number validation
    final RegExp regex = RegExp(r'^\+\d{12}$');

    return regex.hasMatch(phoneNumber);
  }




  Future<void> sendEmail() async {

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context){
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
                      Text("is sending request.",
                        style: TextStyle(fontSize: 27, color: libraPrimary),
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
        }
    );

    var email = await getUserIDPref();

    final smtpServer = gmail('etornamasamoah@gmail.com', 'yrmdporxqxmrvwam');
    final message = Message()
      ..from = Address('info@sendlibra.com', 'Libra')
      //..recipients.add(email)
      ..recipients.add('deladempingship@gmail.com')
      ..subject = 'Account Removal Request on Libra'
      ..text = 'You requested for your account to be removed from Libra database. This request will be processed within 24 hours.';

    try {
      final sendReport = await send(message, smtpServer);

      Navigator.of(context).pop();
      Navigator.of(context).pop();


      WidgetsBinding.instance.addPostFrameCallback((_) {
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
                        Image(image: AssetImage("assets/images/sprinkles.png")),
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
                                Text("Your request will be processed within 24 hours.",
                                  style: TextStyle(fontSize: 21, color: libraPrimary),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(image: AssetImage("assets/icons/verify_check.png")),
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

      });

      Future.delayed(const Duration(seconds: 2), () {

        clearApiKey();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
              (route) => false,
        );

      });

      print('Message sent: ${sendReport.toString()}');

    } catch (e) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();

      print('Error sending email: $e');
    }
  }




  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("quickSendList");
    await prefs.remove("USER_ID");
  }



}
