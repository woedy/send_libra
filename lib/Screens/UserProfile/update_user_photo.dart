import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Screens/Authentication/SignUp/photos/select_photo_options_screen.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_password.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/Screens/UserProfile/models/update_profile_model.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:send_libra/constants.dart';
import 'package:iso_countries/iso_countries.dart';



Future<UpdateProfileModel> updateUserProfile(data) async {
  var email = await getUserIDPref();

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
    return UpdateProfileModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    return UpdateProfileModel.fromJson(jsonDecode(response.body));
  }else if (response.statusCode == 401) {
    return UpdateProfileModel.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to update Profile');
  }
}





class UpdateUserPhotoScreen extends StatefulWidget {
  final data;
  const UpdateUserPhotoScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdateUserPhotoScreen> createState() => _UpdateUserPhotoScreenState();
}

class _UpdateUserPhotoScreenState extends State<UpdateUserPhotoScreen> with SingleTickerProviderStateMixin   {
  TextEditingController controller = TextEditingController(text: "");

  Future<UpdateProfileModel>? _futureUpdateUserProfile;
  AnimationController? _controller;


  File? _image;
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

    return (_futureUpdateUserProfile == null) ? buildColumn() : buildFutureBuilder();




  }



  Widget buildColumn(){
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
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text.rich(TextSpan(
                          text: "Update",
                          style: TextStyle(
                            fontSize: 58,
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
                                "Add your profile\npicture",
                                style: TextStyle(fontSize: 30),
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
                                                "Tap to upload your preferred profile picture",
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 20),
                                              /*   Text(
                                                "(Optional)",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.grey),
                                              ),*/
                                            ],
                                          ),
                                        )
                                            : CircleAvatar(
                                          backgroundImage: FileImage(_image!),
                                          radius: 200.0,
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
                Column(
                  children: [

                    if (_image != null)...[
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

                                final bytes = File(_image!.path).readAsBytesSync();
                                String img64 = base64Encode(bytes);




                                var update_data = {
                                  "email": await getUserIDPref(),
                                  "username": await getUserIDPref(),
                                  "token": await getApiPref(),

                                  "firstname": widget.data.firstname,
                                  "lastname": widget.data.lastname,
                                  "middlename": widget.data.middlename,
                                  "nationality": widget.data.nationality,
                                  "gender": widget.data.gender,

                                  "address1": widget.data.address1,
                                  "city": widget.data.city,
                                  "state": widget.data.state,
                                  "postcode": widget.data.postcode,

                                  "mobile": widget.data.mobile,
                                  "telephone": widget.data.telephone,

                                  "dob": convertDateFormat(widget.data.dob),

                                  "country_of_birth": widget.data.countryOfBirth,
                                  //"country_of_birth": "GH",
                                  "place_of_birth": widget.data.placeOfBirth,

                                  "id1_type": widget.data.idDocuments[0].idDocument[0].idType,
                                  "id1_details": widget.data.idDocuments[0].idDocument[0].idDetails,

                                  "id1_start": widget.data.idDocuments[0].idDocument[0].idStart,
                                  "id1_expiry": widget.data.idDocuments[0].idDocument[0].idExpiry,
                                  "avatar": img64
                                };




                                setState(() {
                                  _futureUpdateUserProfile = updateUserProfile(update_data);
                                });


                                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpUserPasswordScreen()));



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
                                        "Save",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      /* Icon(
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
                    ],
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

            } else {
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
                MaterialPageRoute(builder: (context) => HomeScreen()),
                    (route) => false,
              );
            });

            return const SizedBox();

          }

       /*   WidgetsBinding.instance!.addPostFrameCallback((_) {
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

          Future.delayed(const Duration(seconds: 1), () async {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
                  (route) => false,
            );
          });
*/
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


  String convertDateFormat(String inputDate) {
    // Parse the input date string into a DateTime object
    DateTime date = DateTime.parse(inputDate);

    // Define the desired output format
    final DateFormat outputFormat = DateFormat('dd/MM/yyyy');

    // Format the date using the output format
    String formattedDate = outputFormat.format(date);

    return formattedDate;
  }


}

