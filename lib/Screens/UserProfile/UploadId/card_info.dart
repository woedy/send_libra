
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';

import 'package:send_libra/Screens/UserProfile/UploadId/user_address.dart';


import 'package:send_libra/constants.dart';



class CardInfoScreen extends StatefulWidget {
  final data;
  final update_data;
  const CardInfoScreen({Key? key, required this.data, required this.update_data}) : super(key: key);

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {

  String? id1_type;
  String? id1_details;
  String? id1_start;
  String? id1_expiry;

  String errorMessage = '';

  final _formKey = GlobalKey<FormState>();



  bool hasError = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                          text: "Update ID",
                          style: TextStyle(
                            fontSize: 75,
                          ),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Remitter ID1 Details",
                                      style: TextStyle(fontSize: 36),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),


                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ID Number/Details", style: TextStyle(fontSize: 12),),
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
                                              labelText: "ID Number/Details",
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
                                            textInputAction: TextInputAction.next,
                                            autofocus: false,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'ID number is required';
                                              }
                                              if (value.length < 5) {
                                                return 'ID number too short';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              setState(() {
                                                id1_details = value;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text("ID Type", style: TextStyle(fontSize: 12),),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            _showRelationshipSelectionModal(context);
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
                                                  id1_type ?? 'Select ID Type',
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

                                    SizedBox(
                                      height: 20,
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Start date", style: TextStyle(fontSize: 12),),
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
                                                  return 'Start date required';
                                                }

                                                //bool isValid = isDateBeforeToday(e.toString());



                                                return null;

                                              },
                                              // initialValue: DateTime.parse(widget.data["field_value"].toString()),
                                              onDateSelected: (DateTime value) {

                                              },
                                              onSaved: (value) {
                                                //_onSaveForm(value.toString());
                                                setState(() {

                                                  id1_start = formatDateTime(value.toString());

                                                });

                                              },

                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Expiry date", style: TextStyle(fontSize: 12),),
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
                                                  return 'Expiry date required';
                                                }

                                                //bool isValid = isDateBeforeToday(e.toString());



                                                return null;

                                              },
                                              // initialValue: DateTime.parse(widget.data["field_value"].toString()),
                                              onDateSelected: (DateTime value) {

                                              },
                                              onSaved: (value) {
                                                //_onSaveForm(value.toString());
                                                setState(() {

                                                  id1_expiry = formatDateTime(value.toString());

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
                            ],
                          ),
                        ),
                      ],
                    )),
              /*  Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),*/
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
                            onTap: () {


                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                KeyboardUtil.hideKeyboard(context);

                                if (id1_type != null) {
                                  print('Selected id1_type: $id1_type');
                                  errorMessage = '';

                                  widget.update_data['id1_details'] = id1_details;
                                  widget.update_data['id1_type'] = id1_type;
                                  widget.update_data['id1_start'] = id1_start;
                                  widget.update_data['id1_expiry'] = id1_expiry;

                                  print("##########################");
                                  print(widget.update_data);

                                  setState(() {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddUserAddress(data: widget.data, update_data: widget.update_data,)));

                                  });


                                }else {
                                  // Gender is not selected, show an error message
                                  setState(() {
                                    print('Please select an ID type');
                                    errorMessage = 'Please select an ID type';
                                  });
                                }


                              }
                              
                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddUserAddress(data: widget.data)));






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
                                      "Next",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
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
            ),
          ),
        ),
      ),
    );
  }



  void _showRelationshipSelectionModal (BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Passport'),
                onTap: () {
                  setState(() {
                    id1_type = 'Passport';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Driving_License'),
                onTap: () {
                  setState(() {
                    id1_type = 'Driving_License';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('National_Insurance'),
                onTap: () {
                  setState(() {
                    id1_type = 'National_Insurance';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('National_ID'),
                onTap: () {
                  setState(() {
                    id1_type = 'National_ID';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Utility_Bill'),
                onTap: () {
                  setState(() {
                    id1_type = 'Utility_Bill';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Other'),
                onTap: () {
                  setState(() {
                    id1_type = 'Other';
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
  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
  }



}

