import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:http/http.dart' as http;
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/Screens/UserProfile/profile_screen.dart';
import 'package:send_libra/Screens/UserProfile/user_profile.dart';

import 'dart:async';

import 'package:send_libra/constants.dart';

import '../models/update_profile_model.dart';


Future<UpdateProfileModel> updateUserProfile(data) async {
  var email = await getUserIDPref();
  print(email);

  final response = await http.put(
    Uri.parse(hostName + "/api/v1/profile/user"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      //'Bearer': (await getApiPref()).toString()
    },
    body: jsonEncode(data),

  );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return UpdateProfileModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return UpdateProfileModel.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to update Profile');
  }
}



class AddUserAddress extends StatefulWidget {
  final data;
  final update_data;
  const AddUserAddress({Key? key, required this.data, required this.update_data}) : super(key: key);

  @override
  State<AddUserAddress> createState() => _AddUserAddressState();
}

class _AddUserAddressState extends State<AddUserAddress> with SingleTickerProviderStateMixin  {
  final _formKey = GlobalKey<FormState>();
  Future<UpdateProfileModel>? _futureUpdateUserProfile;



  String? place_of_birth;
  String? address1;
  String? city;
  String? state;
  String? postcode;

  AnimationController? _controller;


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
    //return buildColumn();
    return (_futureUpdateUserProfile == null) ? buildColumn() : buildFutureBuilder();



  }

  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child:    InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),

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
                          Text.rich(TextSpan(
                            text: "Update",
                            style: TextStyle(
                              fontSize: 75,
                            ),
                          )),
                          SizedBox(
                            height: 40,
                          ),


                          SizedBox(
                            height: 40,
                          ),

                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(fontSize: 36),
                                ),
                                SizedBox(
                                  height: 50,
                                ),

                                Text("Place of birth"),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "Place of birth",
                                      labelStyle:
                                      TextStyle(fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    initialValue: widget.data.placeOfBirth,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Place of birth is required';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        place_of_birth = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Address"),
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "Address",
                                      labelStyle:
                                      TextStyle(fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    initialValue: widget.data.address1,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Address is required';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        address1 = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("City"),
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "City",
                                      labelStyle:
                                      TextStyle(fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    initialValue: widget.data.city,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'City is required';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        city = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("State"),
                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "Optional",
                                      labelStyle:
                                      TextStyle(fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    initialValue: widget.data.state,
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        state = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Postcode"),
                                SizedBox(
                                  height: 20,
                                ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white.withOpacity(0.1)),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Postcode",
                                  labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: libraPrimary),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: libraPrimary),
                                  ),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(7),
                                  ],
                                initialValue: widget.data.postcode,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Postcode is required';
                                  }

                                  /*RegExp postcodeRegex = RegExp(r'^[A-Za-z]{2}\d{2}\s\d[A-Za-z]{2}$');
                                  if (!postcodeRegex.hasMatch(value)) {
                                    return 'Invalid postcode';
                                  }*/

                                  return null;
                                },
                                onSaved: (value) {
                                  setState(() {
                                    postcode = value;
                                  });
                                },
                              ),
                            )



                            ],
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Column(
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
                                      onTap: () async {

                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          KeyboardUtil.hideKeyboard(context);

                                          widget.update_data['place_of_birth'] = place_of_birth;
                                          widget.update_data['address1'] = address1;
                                          widget.update_data['city'] = city;
                                          widget.update_data['state'] = state;
                                          widget.update_data['postcode'] = postcode;

                                          widget.update_data['username'] = await getUserIDPref();
                                          //widget.update_data['email'] = await getUserIDPref();
                                          widget.update_data['token'] = await getApiPref();
                                          widget.update_data['avatar'] = widget.data.avatarContent.trim().toString();

                                          print(widget.update_data);
                                          print(jsonEncode(widget.update_data));

                                          setState(() {
                                            _futureUpdateUserProfile = updateUserProfile(widget.update_data);
                                          });

                                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

                                        }



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
                                                "Update",
                                                style: TextStyle(
                                                    fontSize: 15, color: Colors.white),
                                              ),
                                           /*   SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              )*/
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  FutureBuilder<UpdateProfileModel> buildFutureBuilder() {
    return FutureBuilder<UpdateProfileModel>(
        future: _futureUpdateUserProfile,
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
                        Text("is updating profile..",
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
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("######################");
            print(data.message);

            if(data.message == "Profile updated successfully") {

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
                                    height: 320,

                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text("Profile Updated",
                                          style: TextStyle(fontSize: 36, color: libraPrimary),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image(image: AssetImage("assets/icons/verify_check.png")),
                                              ],
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

              });

              Future.delayed(const Duration(seconds: 2), () async {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              });

            }

          }
          else if (snapshot.hasError) {




            WidgetsBinding.instance!.addPostFrameCallback((_) {
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
                                  height: 270,

                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(image: AssetImage("assets/images/libra-dialog.png")),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text("Failed to update profile",
                                        style: TextStyle(fontSize: 23, color: libraPrimary),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.error_outline, color: Colors.red, size: 40,)
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
                    (route) => false,
              );
            });

            return const SizedBox();




          }



          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*   CircularProgressIndicator(),
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




}

