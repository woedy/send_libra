import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:send_libra/Screens/HomeScreen/HomeScreen.dart';
import 'package:send_libra/constants.dart';

class EditProfileFinal extends StatefulWidget {
  const EditProfileFinal({Key? key}) : super(key: key);

  @override
  State<EditProfileFinal> createState() => _EditProfileFinalState();
}

class _EditProfileFinalState extends State<EditProfileFinal> {

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
                    Stack(
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
                                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                      child: Image(
                                        image: AssetImage("assets/images/libra-small.png"),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              height: 350,
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/ed_back7.png"),
                                      fit: BoxFit.cover

                                  )
                              ),

                            ),
                          ],
                        ),
                        Positioned(child: Container(
                          height: 349,
                        child: Lottie.asset('assets/lottie/celebration.json'),

                        ),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ta-da! Your profile is all updated!", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Now you can start sending money across borders. Go ahead and make it rain!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 90,
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

                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));


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
                                                "Enjoy using our app!",
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
