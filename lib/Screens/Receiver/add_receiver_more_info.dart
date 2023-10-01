import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:send_libra/Screens/Authentication/SignUp/photos/select_photo_options_screen.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_password.dart';
import 'package:send_libra/Screens/Receiver/add_receiver_more_info2.dart';
import 'package:send_libra/Screens/Receiver/add_receiver_review.dart';

import 'dart:async';

import 'package:send_libra/constants.dart';



class AddReceiverPersonalInfoMore extends StatefulWidget {
  final data;
  const AddReceiverPersonalInfoMore({Key? key, required this.data}) : super(key: key);

  @override
  State<AddReceiverPersonalInfoMore> createState() => _AddReceiverPersonalInfoMoreState();
}

class _AddReceiverPersonalInfoMoreState extends State<AddReceiverPersonalInfoMore> {

  File? _image;
  String? selectedGender;
  String? relation;
  String? nickname;



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
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
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
                            text: "Beneficiary",
                            style: TextStyle(fontSize: 60,  ),

                          )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "More details...",
                                  style: TextStyle(fontSize: 36),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [10, 10],
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),


                                        ),
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                _showSelectPhotoOptions(context);
                                              },
                                              child: _image == null
                                                  ?  Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(child: Icon(Icons.add_a_photo,size: 30, color: Colors.white,)),

                                                ],
                                              ) : Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: FileImage(_image!),
                                                    fit: BoxFit.contain
                                                  )
                                                ),
                                              ),
                                            ),
                                            if (_image != null)
                                              Positioned(
                                               /* bottom: 0,
                                                right: 0,
                                                left:0,
                                                top: 0,*/
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _image = null;
                                                    });
                                                  },
                                                  child: Icon(Icons.delete_forever, color: Colors.white,),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.red,

                                                    shape: CircleBorder(

                                                    ),
                                                    padding: EdgeInsets.all(2),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        _showGenderSelectionModal(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        width: 220,
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
                                              selectedGender ?? 'Select Gender',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Preferred Name", style: TextStyle(fontSize: 12),),
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
                                        textInputAction: TextInputAction.next,
                                        autofocus: false,
                                        onSaved: (value) {
                                          setState(() {
                                            nickname = value;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),

                                Text("How do  you know the person", style: TextStyle(fontSize: 12),),
                                SizedBox(
                                  height: 30,
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
                                          relation ?? 'Select relationship',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
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
                                        //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserPasswordScreen()));

                                        if (_image != null){
                                          final bytes = File(_image!.path).readAsBytesSync();
                                          String img64 = base64Encode(bytes);


                                          widget.data['avatar'] = img64.toString();
                                          widget.data['gender'] = selectedGender.toString();
                                          widget.data['nickname'] = nickname.toString();
                                          widget.data['relation'] = relation;


                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfoMore2(data: widget.data)));

                                        }else if(selectedGender != null && relation != null) {
                                          widget.data['avatar'] = "";
                                          widget.data['gender'] = selectedGender.toString();
                                          widget.data['nickname'] = nickname;
                                          widget.data['relation'] = relation;


                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfoMore2(data: widget.data)));

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
                      )),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      img = await compressImage(img); // Compress the image
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }


  Future<File?> compressImage(File? imageFile) async {
    if (imageFile == null) return null;

    // Get the image file size
    int fileSizeInBytes = imageFile.lengthSync();
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;

    // Check if image size is already below 2MB
    if (fileSizeInMB < 2) {
      return imageFile;
    }

    // Compress the image
    List<int> compressedBytes = (await FlutterImageCompress.compressWithFile(
      imageFile.absolute.path,
      quality: 70, // Adjust the quality value as needed
    )) as List<int>;

    // Create a new compressed image file
    File compressedFile = File(imageFile.path);
    await compressedFile.writeAsBytes(compressedBytes);

    return compressedFile;
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

  void _showRelationshipSelectionModal (BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Friend'),
                onTap: () {
                  setState(() {
                    relation = 'Friend';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Family'),
                onTap: () {
                  setState(() {
                    relation = 'Family';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Co-Worker'),
                onTap: () {
                  setState(() {
                    relation = 'Co-Worker';
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



}

