
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:send_libra/Components/countries.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_password.dart';
import 'package:send_libra/constants.dart';

class SignUpUserInfo2Screen extends StatefulWidget {
  final data;
  const SignUpUserInfo2Screen({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpUserInfo2Screen> createState() => _SignUpUserInfo2ScreenState();
}

class _SignUpUserInfo2ScreenState extends State<SignUpUserInfo2Screen> {
  TextEditingController controller = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String? _code;
  String _number = "";
  String? dob;
  String country = "GH";

  bool hasError = false;

  FocusNode focusNode = FocusNode();



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
                Expanded(
                  flex: Platform.isAndroid ? 3 : 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Image(image: AssetImage("assets/images/libra-small.png"),)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text.rich(
                            TextSpan(
                              text: "Sign Up",
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
                              Text("Let’s get you\nstarted", style: TextStyle(fontSize: 36),),
                              SizedBox(
                                height: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone Number", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  IntlPhoneField(
                                    focusNode: focusNode,
                                    style: TextStyle(color: Colors.white),
                                    dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                                    decoration: InputDecoration(
                                      // labelText: 'Phone Number',
                                        border: OutlineInputBorder(

                                          borderSide: BorderSide(
                                              color: Colors.transparent
                                          ),
                                        ),
                                        enabledBorder:  new OutlineInputBorder(
                                          borderSide:  BorderSide(color: Colors.white.withOpacity(0.1)),
                                        ),
                                        focusedBorder:  new OutlineInputBorder(
                                          borderSide:  BorderSide(color: Colors.white.withOpacity(0.1)),
                                        )
                                    ),
                                    languageCode: "en",
                                    initialCountryCode: "GH",
                                    validator: (e){
                                      if(e == null){
                                        return 'Phone Number required';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      _code = value.countryCode.toString();
                                      _number = value.number.toString();
                                      country = value.countryISOCode.toString();
                                    },
                                    onCountryChanged: (country) {

                                    },

                                    onSaved: (value) {
                                      //_onSaveForm(value.toString());
                                      setState(() {
                                        _code = value!.countryCode.toString();
                                        _number = value.number.toString();
                                        country = value.countryISOCode.toString();

                                      });

                                    },

                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date of birth", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 63,
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.1))),
                                    child: Center(
                                      child: DateTimeFormField(
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(color: Colors.white),
                                          errorStyle: TextStyle(color: Colors.redAccent),
                                          border: InputBorder.none,
                                          suffixIcon: Icon(Icons.event_note, color: Colors.white,),
                                          labelText: 'Select Date',
                                          labelStyle: TextStyle(color: Colors.grey),
                                        ),

                                        mode: DateTimeFieldPickerMode.date,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (e) {
                                          if(e == null){
                                            return 'Date of birth required';
                                          }

                                          bool isValid = isDateBeforeToday(formatDateTime(e.toString()));

                                          if (isValid) {

                                          }else {
                                            return "DOB should be between 16 and 150 years";
                                          }


                                          return null;

                                        },
                                        // initialValue: DateTime.parse(widget.data["field_value"].toString()),
                                        onDateSelected: (DateTime value) {

                                        },
                                        onSaved: (value) {
                                          //_onSaveForm(value.toString());
                                          setState(() {

                                            dob = formatDateTime(value.toString());

                                          });

                                        },

                                      ),
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Align(
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

                              widget.data['phone'] = _code.toString() + _number.toString() ;
                              widget.data['dob'] = dob;
                              widget.data['country'] = country;



                              if(_number == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Phone number required.', style: TextStyle(color: Colors.red
                                    ),),
                                  ),
                                );
                              } else{
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserInfoPassword(data: widget.data)));

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
                  ),)


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






  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
  }





  String? getCountryNameFromDialCode(String dialCode) {
    final country = Countries.allCountries.firstWhere((element) => element['dial_code'] == dialCode, orElse: () => {});
    return country?['name'];
  }




  bool isDateBeforeToday(String dob) {

    List<String> parts = dob.split('/');
    int? day = int.tryParse(parts[0]);
    int? month = int.tryParse(parts[1]);
    int? year = int.tryParse(parts[2]);

    DateTime currentDate = DateTime.now();
    DateTime enteredDate = DateTime(year!, month!, day!);

    if (enteredDate.isAfter(currentDate.subtract(Duration(days: 16 * 365))) ||
        enteredDate.isBefore(currentDate.subtract(Duration(days: 150 * 365)))) {
      return false;
    }

    return true;
  }


}

