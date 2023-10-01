
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:send_libra/Components/keyboard_utils.dart';

import 'package:send_libra/Screens/Receiver/add_receiver_review.dart';


import 'package:send_libra/constants.dart';



class AddReceiverPersonalInfoMore2 extends StatefulWidget {
  final data;
  const AddReceiverPersonalInfoMore2({Key? key, required this.data}) : super(key: key);

  @override
  State<AddReceiverPersonalInfoMore2> createState() => _AddReceiverPersonalInfoMore2State();
}

class _AddReceiverPersonalInfoMore2State extends State<AddReceiverPersonalInfoMore2> {
  final _formKey = GlobalKey<FormState>();


  String? address1;
  String? city;
  String? state;



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
                Form(
                  key: _formKey,
                  child: Container(
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
                                  "Address",
                                  style: TextStyle(fontSize: 36),
                                ),
                                SizedBox(
                                  height: 50,
                                ),

                                Text("Address"),
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
                                      labelText: "Address",
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Address is required';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        address1 = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("City"),
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
                                      labelText: "City",
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'City is required';
                                      }
                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        city = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("State"),
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
                                        state = value;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

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

                                          widget.data['address1'] = address1;
                                          widget.data['city'] = city;
                                          widget.data['state'] = state;


                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverReview(data: widget.data)));

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
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }





}

