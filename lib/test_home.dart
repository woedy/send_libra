import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TestWork extends StatefulWidget {
  const TestWork({Key? key}) : super(key: key);

  @override
  State<TestWork> createState() => _TestWorkState();
}

class _TestWorkState extends State<TestWork> {

  FocusNode focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: IntlPhoneField(
            focusNode: focusNode,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
             // labelText: 'Phone Number',
              border: OutlineInputBorder(

                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              enabledBorder:  new OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.white ),
              )
            ),
            languageCode: "en",
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            onCountryChanged: (country) {
              print('Country changed to: ' + country.name);
            },
          ),
        ),
      ),
    );
  }
}
