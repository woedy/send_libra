import 'dart:convert';
import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_1.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_final_7.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/UserProfile/models/update_profile_model.dart';
import 'package:send_libra/constants.dart';



import 'package:http/http.dart' as http;



Future<UpdateProfileModel> updateUserProfile(data) async {
  var email = await getUserIDPref();
  print(email);

  final response = await http.put(
    Uri.parse(hostName + "/api/v1/profile/user"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      //'Bearer': (await getApiPref()).toString(),
      //"Auth":
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



class EditProfileAddress extends StatefulWidget {
  final reg_data;
  final profile_data;

  const EditProfileAddress({Key? key, required this.reg_data, required this.profile_data}) : super(key: key);

  @override
  State<EditProfileAddress> createState() => _EditProfileAddressState();
}

class _EditProfileAddressState extends State<EditProfileAddress> with SingleTickerProviderStateMixin   {

  String? address1;
  String? address2;
  String? city;
  String? postcode;


  String errorMessage = '';

  final _formKey = GlobalKey<FormState>();


  Future<UpdateProfileModel>? _futureUpdateUserProfile;
  AnimationController? _controller;


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


    return (_futureUpdateUserProfile == null) ? buildColumn() : buildFutureBuilder();


  }


  Widget buildColumn(){
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      child: Row(
                        children: [
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, ),
                            child:  Container(
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
                            ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 156,
                      decoration: BoxDecoration(
                        //color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/images/ed_back6.png"),
                              fit: BoxFit.cover

                          )
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Almost there, " + widget.reg_data['first_name'], style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Now, we just need your current living address. You know, the place where you get all your exciting mail and packages!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 20,
                          ),

                          Form(
                            key: _formKey,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [



                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("First Line Address"),
                                          SizedBox(
                                            height: 10,
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
                                                labelText: "",
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
                                      height: 20,
                                    ),

                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Second Line Address"),
                                          SizedBox(
                                            height: 10,
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
                                                labelText: "optional",
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
                                              validator: (value) {

                                              },
                                              textInputAction: TextInputAction.next,
                                              autofocus: false,
                                              onSaved: (value) {
                                                setState(() {
                                                  address2 = value;
                                                });
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Town or city"),
                                                SizedBox(
                                                  height: 10,
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
                                                      labelText: "",
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
                                        ),

                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Post Code / Zip Code"),
                                                SizedBox(
                                                  height: 10,
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
                                                      labelText: "",
                                                      labelStyle:
                                                      TextStyle(fontSize: 13, color: bodyText2),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: libraPrimary)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: libraPrimary)),
                                                      border: InputBorder.none,),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(7),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,

                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Post Code/Zip Code is required';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      setState(() {
                                                        postcode = value;
                                                      });
                                                    },
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                    SizedBox(
                                      height: 30,
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



                                                    widget.profile_data['email'] = widget.reg_data['email'];
                                                    widget.profile_data['username'] = widget.reg_data['email'];
                                                    widget.profile_data['token'] = await getApiPref();

                                                    widget.profile_data['firstname'] = widget.reg_data['first_name'];
                                                    widget.profile_data['lastname'] = widget.reg_data['last_name'];
                                                    widget.profile_data['middlename'] = "";




                                                    widget.profile_data['address1'] = address1;
                                                    widget.profile_data['address2'] = address2;
                                                    widget.profile_data['city'] = city;
                                                    widget.profile_data['state'] = "";
                                                    widget.profile_data['postcode'] = postcode;

                                                    widget.profile_data['mobile'] = widget.reg_data['phone'];
                                                    widget.profile_data['telephone'] = widget.reg_data['phone'];

                                                    widget.profile_data['dob'] = widget.reg_data['dob'];
                                                    //widget.profile_data['dob'] = "04/01/1992";

                                                    widget.profile_data['country_of_birth'] = widget.profile_data['nationality'];
                                                    widget.profile_data['place_of_birth'] = widget.profile_data['nationality'];


                                                    log(widget.profile_data.toString());

                                                    //print(widget.profile_data);


                                                    setState(() {
                                                      _futureUpdateUserProfile = updateUserProfile(widget.profile_data);
                                                    });


                                                    //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditProfileFinal()));


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
                                                          "On to the last step",
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
                                          height: 40,
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),





                        ],
                      ),
                    ),

                  ],
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

              /*WidgetsBinding.instance.addPostFrameCallback((_) {
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

              });*/

              Future.delayed(const Duration(milliseconds: 500), () async {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileFinal()),
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
                MaterialPageRoute(builder: (context) => EditProfileIntro(reg_data: widget.reg_data,)),
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







  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
  }



}
