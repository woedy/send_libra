
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/UserProfile/UploadId/upload_id.dart';
import 'package:send_libra/constants.dart';

class UpdateUserInfo2Screen extends StatefulWidget {
  final data;
  final update_data;

  const UpdateUserInfo2Screen({Key? key, required this.data, required this.update_data }) : super(key: key);

  @override
  State<UpdateUserInfo2Screen> createState() => _UpdateUserInfo2ScreenState();
}

class _UpdateUserInfo2ScreenState extends State<UpdateUserInfo2Screen> {
  TextEditingController controller = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? telephone;
  String? dob;

  bool hasError = false;


  @override
  Widget build(BuildContext context) {

    print("####################");
    print("####################");
    print("####################");
    print(widget.data);



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
                                height: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone Number", style: TextStyle(fontSize: 12),),
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
                                        labelText: "Phone Number",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.data!.mobile.toString(),

                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Phone number is required';
                                        }

                                        bool isValid = validatePhoneNumber(value);

                                        if (isValid) {
                                          print("THE NUMBER IS VALID");
                                        } else {
                                          return "international format required. Eg.+441234800000.";
                                        }

                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          phone = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Telephone", style: TextStyle(fontSize: 12),),
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
                                        labelText: "Telephone",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.data!.mobile.toString(),

                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {

                                        if(value!.isEmpty) {
                                          return null;
                                        }


                                        bool isValid = validatePhoneNumber(value!);

                                        if (isValid) {
                                          print("THE NUMBER IS VALID");
                                        } else {
                                          return "international format required. Eg.+441234800000.";
                                        }

                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          telephone = value;
                                        });
                                      },
                                    ),
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
                                        initialValue: DateTime.parse(widget.data!.dob),
                                        mode: DateTimeFieldPickerMode.date,
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (e) {
                                          if(e == null){
                                            return 'Date of birth required';
                                          }

                                          bool isValid = isDateBeforeToday(e.toString());

                                          if (isValid) {

                                          }else {
                                            return "The dob field must be a date before today.";
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
                      ),

                      SizedBox(
                        height: 30,
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

                                  widget.update_data['mobile'] = phone;
                                  widget.update_data['telephone'] = telephone;
                                  widget.update_data['dob'] = dob;

                                  print(widget.update_data);


                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UploadIDScreen(data: widget.data, update_data: widget.update_data,)));

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

  bool isDateBeforeToday(String inputDate) {
    DateTime currentDate = DateTime.now();
    DateTime date = DateTime.parse(inputDate);

    // Extract only the date part from the input date
    DateTime inputDateOnly = DateTime(date.year, date.month, date.day);

    // Extract only the date part from the current date
    DateTime currentDateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Check if the input date is before today
    if (inputDateOnly.isBefore(currentDateOnly)) {
      return true;
    } else {
      return false;
    }
  }




}

