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
import 'package:send_libra/Screens/UserProfile/UploadId/card_info.dart';

import 'dart:async';

import 'package:send_libra/constants.dart';



class UploadIDScreen extends StatefulWidget {
  final data;
  final update_data;
  const UploadIDScreen({Key? key, required this.data, required this.update_data}) : super(key: key);

  @override
  State<UploadIDScreen> createState() => _UploadIDScreenState();
}

class _UploadIDScreenState extends State<UploadIDScreen> {
  TextEditingController controller = TextEditingController(text: "");

  File? _image;



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
                          text: "Upload ID",
                          style: TextStyle(
                            fontSize: 75,
                          ),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add your ID Card",
                                style: TextStyle(fontSize: 36),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20),
                                dashPattern: [10, 10],
                                color: Colors.grey,
                                strokeWidth: 2,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _showSelectPhotoOptions(context);
                                        },
                                        child: _image == null
                                            ? Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_a_photo,
                                                size: 50,
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                "Tap to upload your ID card",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        )
                                            : Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(_image!)
                                            )
                                          ),
                                        )
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
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),

                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),

                if (_image != null)...[
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
                                  widget.update_data['id1_scan'] = img64;

                                  print(widget.update_data);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CardInfoScreen(data: widget.data, update_data: widget.update_data,)));


                                }else {
                                  var _data = {};
                                  print("Mooooving");
                                  print(widget.update_data);
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CardInfoScreen(data: widget.data, update_data: widget.update_data,)));

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
                ]
              ],
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



}

