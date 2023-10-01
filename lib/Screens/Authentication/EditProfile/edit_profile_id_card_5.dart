import 'dart:convert';
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_address_6.dart';
import 'package:send_libra/Screens/Authentication/SignUp/photos/select_photo_options_screen.dart';
import 'package:send_libra/constants.dart';

class EditProfileIDCard extends StatefulWidget {
  final reg_data;
  final profile_data;

  const EditProfileIDCard({Key? key, required this.reg_data, required this.profile_data}) : super(key: key);

  @override
  State<EditProfileIDCard> createState() => _EditProfileIDCardState();
}

class _EditProfileIDCardState extends State<EditProfileIDCard> {

  File? _image;


  String? id1_type;
  String? id1_details;
  String? id1_start;
  String? id1_expiry;

  String errorMessage = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                            margin: EdgeInsets.symmetric(horizontal: 5, ),
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
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Now for some\nofficial stuff.", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Could you upload an ID? This could be your driving license or passport.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 20,
                          ),



                          Form(
                            key: _formKey,
                            child: Column(
                              children: [

                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        _showSelectPhotoOptions(context);
                                      },
                                      child: _image == null
                                          ? Container(
                                        height: 120,
                                        width: MediaQuery.of(context).size.width,
                                        //color: Colors.white,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/id_demo.png"),
                                            fit: BoxFit.cover
                                          )
                                        ),
                                        
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image(image: AssetImage("assets/icons/card_ic.png"), height: 33,),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Tap to upload ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,) ,)
                                          ],
                                        ),

                                      )
                                          : Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(

                                                image: FileImage(_image!),
                                              fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                    if (_image != null)
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _image = null;
                                            });
                                          },
                                          child: Icon(Icons.delete_forever, color: Colors.white,),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(8),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Text("ID Type", style: TextStyle(fontSize: 12),),
                                          SizedBox(
                                            height: 10,
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
                                            height: 5,
                                          ),

                                          Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10),
                                              child: Text(errorMessage, style: TextStyle(color: Colors.red),))
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Enter your ID Number", style: TextStyle(fontSize: 12),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            //height: 66,
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
                                                labelText: "ID Number",
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

                                        ],
                                      ),



                                      SizedBox(
                                        height: 15,
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Start date", style: TextStyle(fontSize: 12),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 60,
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                                                  ),
                                                  child: Center(
                                                    child: DateTimeFormField(
                                                      decoration: const InputDecoration(
                                                        hintStyle: TextStyle(color: Colors.white),
                                                        errorStyle: TextStyle(color: Colors.redAccent),
                                                        border: InputBorder.none,
                                                        suffixIcon: Icon(Icons.event_note, color: Colors.white),
                                                        labelText: 'Start Date',
                                                        labelStyle: TextStyle(color: Colors.grey),
                                                      ),
                                                      mode: DateTimeFieldPickerMode.date,
                                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                                      validator: (e) {
                                                        if (e == null) {
                                                          return 'Start date required';
                                                        }

                                                        /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                        return null;
                                                      },
                                                      onDateSelected: (DateTime value) {},
                                                      onSaved: (value) {
                                                        setState(() {
                                                          id1_start = formatDateTime(value.toString());
                                                        });
                                                      },
                                                      dateFormat: DateFormat("MM/yy"), // Specify the desired date format (month/year)
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),

                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Expiry date", style: TextStyle(fontSize: 12),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 60,
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                                                  ),
                                                  child: Center(
                                                    child: DateTimeFormField(
                                                      decoration: const InputDecoration(
                                                        hintStyle: TextStyle(color: Colors.white),
                                                        errorStyle: TextStyle(color: Colors.redAccent),
                                                        border: InputBorder.none,
                                                        suffixIcon: Icon(Icons.event_note, color: Colors.white),
                                                        labelText: 'Expiry Date',
                                                        labelStyle: TextStyle(color: Colors.grey),
                                                      ),
                                                      mode: DateTimeFieldPickerMode.date,
                                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                                      validator: (e) {
                                                        if (e == null) {
                                                          return 'Expiry date required';
                                                        }

                                                        /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                        return null;
                                                      },
                                                      onDateSelected: (DateTime value) {},
                                                      onSaved: (value) {
                                                        setState(() {
                                                          id1_expiry = formatDateTime(value.toString());
                                                        });
                                                      },
                                                      dateFormat: DateFormat("MM/yy"), // Specify the desired date format (month/year)
                                                    ),
                                                  ),
                                                ),

                                              ],
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
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        width: 384,
                        height: 55,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: libraBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (_image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please add an ID Card.'),
                                  ),
                                );
                              } else {


                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  KeyboardUtil.hideKeyboard(context);

                                  if (id1_type == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Please select an ID type.'),
                                      ),
                                    );


                                  }else{
                                    final bytes = File(_image!.path).readAsBytesSync();
                                    String img64 = base64Encode(bytes);

                                    widget.profile_data['id1_scan'] = img64;
                                    widget.profile_data['id1_type'] = id1_type;
                                    widget.profile_data['id1_details'] = id1_details;
                                    widget.profile_data['id1_start'] = id1_start;
                                    widget.profile_data['id1_expiry'] = id1_expiry;

                                    //print(widget.profile_data);


                                    Navigator.of(context).push(
                                       MaterialPageRoute(builder: (BuildContext context) => EditProfileAddress(reg_data: widget.reg_data, profile_data: widget.profile_data,)));
                                  }



                                }

                                // Navigate to the next screen

                              }
                            },
                            child: Align(
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Let's go",
                                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                      height: 40,
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

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }



  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }






}
