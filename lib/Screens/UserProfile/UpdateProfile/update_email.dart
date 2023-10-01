import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info.dart';
import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_profile_country.dart';
import 'package:send_libra/constants.dart';


class UpdateEmailScreen extends StatefulWidget {
  final data;
  final update_data;

  const UpdateEmailScreen({Key? key, required this.data, required this.update_data}) : super(key: key);

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? selectedGender;



  @override
  Widget build(BuildContext context) {

    print("############################");
    print("############################");
    print("############################");
    print(widget.data.gender);



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: Platform.isAndroid ? 3 : 3,
                  child: Column(
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
                              text: "Update",
                              style: TextStyle(fontSize: 75,  ),

                            )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Let’s help you\nupdate your profile", style: TextStyle(fontSize: 36),),
                              SizedBox(
                                height: 30,
                              ),
                              Text("Enter your Email", style: TextStyle(fontSize: 12),),
                              SizedBox(
                                height: 30,
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
                                    labelText: "Email",
                                    labelStyle:
                                    TextStyle(fontSize: 13, color: bodyText2),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: libraPrimary)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: libraPrimary)),
                                    border: InputBorder.none,),
                                  initialValue: widget.data!.email.toString(),

                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(225),
                                    PasteTextInputFormatter(),
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email is required';
                                    }
                                    if (value.length < 3) {
                                      return 'Name too short';
                                    }
                                    String pattern =
                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                        r"{0,253}[a-zA-Z0-9])?)*$";
                                    RegExp regex = RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Enter a valid email address';

                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  autofocus: false,
                                  onSaved: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),

                              Text("Select your gender", style: TextStyle(fontSize: 12),),
                              SizedBox(
                                height: 30,
                              ),

                              GestureDetector(
                                onTap: () {
                                  _showGenderSelectionModal(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.1))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedGender ?? "Select Gender",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(errorMessage, style: TextStyle(color: Colors.red),))

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
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


                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  KeyboardUtil.hideKeyboard(context);

                                  if (selectedGender != null) {
                                    print('Selected gender: $selectedGender');
                                    errorMessage = '';

                                    widget.update_data['email'] = email;
                                    widget.update_data['gender'] = selectedGender;
                                    //widget.update_data['nationality'] = widget.data.data!.nationality.toString();
                                    print("###############");
                                    print(widget.update_data);

                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UpdateProfileCountry(data: widget.data, update_data: widget.update_data,)));

                                  } else {
                                    // Gender is not selected, show an error message
                                    setState(() {
                                      print('Please select a gender');
                                      errorMessage = 'Please select a gender';
                                    });
                                  }




                                }

                              },
                              child: Align(
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Next",
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
                ),




              ],
            ),
          ),
        ),
      ),
    );


  }


  void _showGenderSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Male'),
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Female'),
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String errorMessage = '';



}
