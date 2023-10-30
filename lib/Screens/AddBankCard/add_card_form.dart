import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Screens/BankDetails/payment_mode_card_listscreen.dart';
import 'package:send_libra/constants.dart';


class AddBankCardForm extends StatefulWidget {
  const AddBankCardForm({Key? key}) : super(key: key);

  @override
  State<AddBankCardForm> createState() => _AddBankCardFormState();
}

class _AddBankCardFormState extends State<AddBankCardForm> {
  TextEditingController controller = TextEditingController(text: "");



  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Add Bank\ncard",
                          style: TextStyle(
                            fontSize: 60,
                          ),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Text.rich(TextSpan(
                          text: "Select your card",
                          style: TextStyle(
                            fontSize: 36,
                          ),
                        )),
                        SizedBox(
                          height: 30,
                        ),
                        Text.rich(TextSpan(
                          text: "New bank card",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),

                        SizedBox(
                          height: 30,
                        ),

                        Image(image: AssetImage("assets/icons/cards.png")),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Full name on card",
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
                                        border: Border.all(color: Colors.white.withOpacity(0.1))
                                    ),
                                    child: TextFormField(

                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Password',

                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontWeight: FontWeight.normal),
                                          //labelText: "Password",
                                          labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                        border: InputBorder.none,),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),],
                                      validator: (name) {
                                        if (name!.isEmpty) {
                                          return 'Name is required';
                                        }
                                        if (name.length < 3) {
                                          return 'Name too short';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: true,
                                      onSaved: (value) {

                                        setState(() {

                                        });



                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height:40,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enter card number",
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
                                        border: Border.all(color: Colors.white.withOpacity(0.1))
                                    ),
                                    child: TextFormField(

                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Password',

                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontWeight: FontWeight.normal),
                                          //labelText: "Password",
                                          labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.transparent)),
                                        border: InputBorder.none,),
                                      inputFormatters: [LengthLimitingTextInputFormatter(225), PasteTextInputFormatter(),],
                                      validator: (name) {
                                        if (name!.isEmpty) {
                                          return 'Name is required';
                                        }
                                        if (name.length < 3) {
                                          return 'Name too short';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: true,
                                      onSaved: (value) {

                                        setState(() {

                                        });



                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height:40,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Expiry date",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 50,
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
                                                //labelText: 'Expiry Date',
                                                labelStyle: TextStyle(color: Colors.grey),
                                              ),
                                              mode: DateTimeFieldPickerMode.date,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              validator: (e) {
                                                if (e == null) {
                                                  return 'Expiry date required';
                                                }

                                                return null;
                                              },
                                              onDateSelected: (DateTime value) {},
                                              onSaved: (value) {
                                                setState(() {
                                                  //id1_expiry = formatDateTime(value.toString());
                                                });
                                              },
                                              dateFormat: DateFormat("MM/yy"), // Specify the desired date format (month/year)
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height:40,
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
                                        Text(
                                          "CCV/CSV",
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
                                              border: Border.all(color: Colors.white.withOpacity(0.1))
                                          ),
                                          child: TextFormField(

                                            style: TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              //hintText: 'Enter Password',

                                                hintStyle: TextStyle(
                                                    color: Colors.grey, fontWeight: FontWeight.normal),
                                                //labelText: "Password",
                                                labelStyle: TextStyle(fontSize: 13, color: bodyText2),
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.transparent)),
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.transparent)),
                                              border: InputBorder.none,),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(225),
                                              PasteTextInputFormatter(),
                                            ],
                                            validator: (name) {
                                              if (name!.isEmpty) {
                                                return 'Name is required';
                                              }
                                              if (name.length < 3) {
                                                return 'Name too short';
                                              }
                                              return null;
                                            },
                                            textInputAction: TextInputAction.next,
                                            autofocus: true,
                                            onSaved: (value) {

                                              setState(() {

                                              });



                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height:40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),


/*

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_box, color: libraBlue,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("My billing address is same as my home", style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_box, color: libraBlue,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Save this account for future use", style: TextStyle(color: Colors.white),)
                                    ],
                                  )
                                ],
                              ),

                              SizedBox(
                                height: 30,
                              ),

                              Center(child: Image(image: AssetImage("assets/icons/visa.png"))),
*/

                              SizedBox(
                                height: 30,
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
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => PaymentModeCardList(),
                                            ));
/*
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {

                                                return SendMoneyCustomLibraDialog(
                                                  message1: "is connecting to\nyour bank..." ,
                                                  message2: "is verifying your\nmode of payment" ,
                                                  image: AssetImage("assets/icons/bankcard.png"),
                                                  is_celebration: true,
                                                );

                                              },
                                            );*/
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
                                                    "Continue",
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
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),


                            ],
                          ),
                        ),
                      ],
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }




}

