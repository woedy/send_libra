import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_country_3.dart';
import 'package:send_libra/constants.dart';

class EditProfileGender extends StatefulWidget {
  final reg_data;
  final profile_data;
  const EditProfileGender({Key? key, required this.reg_data, required this.profile_data}) : super(key: key);

  @override
  State<EditProfileGender> createState() => _EditProfileGenderState();
}

class _EditProfileGenderState extends State<EditProfileGender> {

  String? selectedGender = "Male";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5,),
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
                      Container(
                        child: Image.asset("assets/images/ed_back2.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text("First things first, could you let us know if you identify as.", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),),
                            SizedBox(
                              height: 40,
                            ),

                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = 'Male';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedGender == 'Male' ? Colors.blue : Colors.white,
                                        ),
                                        child: selectedGender == 'Male'
                                            ? Center(
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                            : null,
                                      ),
                                      SizedBox(width: 15),
                                      Icon(Icons.male, color: Colors.white),
                                      SizedBox(width: 10),
                                      Text(
                                        "Male",
                                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = 'Female';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedGender == 'Female' ? Colors.blue : Colors.white,
                                        ),
                                        child: selectedGender == 'Female'
                                            ? Center(
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                            : null,
                                      ),
                                      SizedBox(width: 15),
                                      Icon(Icons.female, color: Colors.white),
                                      SizedBox(width: 10),
                                      Text(
                                        "Female",
                                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                                Align(
                                  child: Container(
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



                                          widget.profile_data['gender'] = selectedGender;
                                          print(widget.profile_data);

                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (BuildContext context) => EditProfileCountry(reg_data: widget.reg_data, profile_data: widget.profile_data,)),
                                          );
                                        },
                                        child: Align(
                                          child: Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Next",
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
                              ],
                            )


                          ],
                        ),
                      ),

                    ],
                  )),




            ],
          ),
        ),
      ),
    );
  }
}
