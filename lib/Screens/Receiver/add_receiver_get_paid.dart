import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Receiver/add_receiver_personal_info.dart';
import 'package:send_libra/constants.dart';

class AddReceiverGetPaidScreen extends StatefulWidget {
  final data;
  const AddReceiverGetPaidScreen({Key? key, required this.data})
      : super(key: key);

  @override
  State<AddReceiverGetPaidScreen> createState() =>
      _AddReceiverGetPaidScreenState();
}

class _AddReceiverGetPaidScreenState extends State<AddReceiverGetPaidScreen> {
  final _formKey = GlobalKey<FormState>();

  String? mobile_transfer_number;
  bool isImageSelected = false;

  int selectedItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: Platform.isAndroid ? 4 : 4,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
                              child: InkWell(
                                onTap: () {
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
                                      color: clay),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text.rich(TextSpan(
                                text: "Beneficiary",
                                style: TextStyle(
                                  fontSize: 60,
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "How they get\npaid",
                                    style: TextStyle(fontSize: 36),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Payment Method",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 110,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex =
                                                  0; // Set the index of the selected item
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: selectedItemIndex == 0
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                                width: 1,
                                              ),
                                              color: selectedItemIndex == 0
                                                  ? clay
                                                  : Colors.transparent,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Image(
                                                    height: 50,
                                                    width: 50,
                                                    image: AssetImage(
                                                        "assets/images/mtn.png"),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text("Mtn Mobile Money"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex =
                                                  1; // Set the index of the selected item
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: selectedItemIndex == 1
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                                width: 1,
                                              ),
                                              color: selectedItemIndex == 1
                                                  ? clay
                                                  : Colors.transparent,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Image(
                                                    height: 50,
                                                    width: 50,
                                                    image: AssetImage(
                                                        "assets/images/voda.png"),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text("Vodafone"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex =
                                                  2; // Set the index of the selected item
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: selectedItemIndex == 2
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                                width: 1,
                                              ),
                                              color: selectedItemIndex == 2
                                                  ? clay
                                                  : Colors.transparent,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Image(
                                                    height: 50,
                                                    width: 50,
                                                    image: AssetImage(
                                                        "assets/images/tigo.png"),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text("Tigo"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedItemIndex =
                                                  3; // Set the index of the selected item
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: selectedItemIndex == 3
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                                width: 1,
                                              ),
                                              color: selectedItemIndex == 3
                                                  ? clay
                                                  : Colors.transparent,
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Image(
                                                    height: 50,
                                                    width: 50,
                                                    image: AssetImage(
                                                        "assets/images/bank.png"),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text("Bank Card"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (selectedItemIndex == 3) ...[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Number",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "4444 4444 4444 4444",
                                      labelStyle: TextStyle(
                                          fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    keyboardType: TextInputType.phone,
                                    //initialValue: widget.data['mobile'],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Card number is required';
                                      }

                                      bool isValid = validatePhoneNumber(value);

                                      if (isValid) {
                                        print("THE NUMBER IS VALID");
                                      } else {
                                        return "Card format should be 4444 4444 4444";
                                      }

                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        mobile_transfer_number = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transfer Number",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      //color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color:
                                              Colors.white.withOpacity(0.1))),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      //hintText: 'Enter Username/Email',

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      labelText: "Ex. +447373838388",
                                      labelStyle: TextStyle(
                                          fontSize: 13, color: bodyText2),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: libraPrimary)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: libraPrimary)),
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(225),
                                      PasteTextInputFormatter(),
                                    ],
                                    keyboardType: TextInputType.phone,
                                    initialValue: widget.data['mobile'],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Transfer number is required';
                                      }

                                      bool isValid = validatePhoneNumber(value);

                                      if (isValid) {
                                        print("THE NUMBER IS VALID");
                                      } else {
                                        return "international format required. Eg.+447373838388.";
                                      }

                                      return null;
                                    },
                                    textInputAction: TextInputAction.next,
                                    autofocus: false,
                                    onSaved: (value) {
                                      setState(() {
                                        mobile_transfer_number = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            if (selectedItemIndex == -1)
                              ...[]
                            else ...[
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

                                          if (selectedItemIndex == 0) {
                                            widget.data[
                                                    'mobile_transfer_number'] =
                                                mobile_transfer_number;
                                            widget.data[
                                                    'mobile_transfer_network'] =
                                                "MTN Ghana";
                                            widget.data[
                                                    'mobile_transfer_network_id'] =
                                                "1";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type_id'] =
                                                "22";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type'] =
                                                "12";

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        AddReceiverPersonalInfo(
                                                          data: widget.data,
                                                        )));
                                          } else if (selectedItemIndex == 1) {
                                            widget.data[
                                                    'mobile_transfer_number'] =
                                                mobile_transfer_number;
                                            widget.data[
                                                    'mobile_transfer_network'] =
                                                "vodafone";
                                            widget.data[
                                                    'mobile_transfer_network_id'] =
                                                "2";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type_id'] =
                                                "22";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type'] =
                                                "12";

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        AddReceiverPersonalInfo(
                                                          data: widget.data,
                                                        )));
                                          } else if (selectedItemIndex == 2) {
                                            widget.data[
                                                    'mobile_transfer_number'] =
                                                mobile_transfer_number;
                                            widget.data[
                                                    'mobile_transfer_network'] =
                                                "AirtelTigo";
                                            widget.data[
                                                    'mobile_transfer_network_id'] =
                                                "3";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type_id'] =
                                                "22";
                                            widget.data[
                                                    'mobile_transfer_network_credit_type'] =
                                                "12";

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        AddReceiverPersonalInfo(
                                                          data: widget.data,
                                                        )));
                                          } else if (selectedItemIndex == 3) {
/*
                                            widget.data['mobile_transfer_number'] = mobile_transfer_number;
                                            widget.data['mobile_transfer_network'] = "AirtelTigo";
                                            widget.data['mobile_transfer_network_id'] = "3";
                                            widget.data['mobile_transfer_network_credit_type_id'] = "22";
                                            widget.data['mobile_transfer_network_credit_type'] = "12";
*/

                                            //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddReceiverPersonalInfo(data: widget.data,)));
                                          }
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
                                                    fontSize: 15,
                                                    color: Colors.white),
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
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
}
