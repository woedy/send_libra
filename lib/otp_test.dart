import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputWidget extends StatefulWidget {
  @override
  _OTPInputWidgetState createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  List<FocusNode>? _focusNodes;
  List<TextEditingController>? _controllers;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());

    // Add listeners to text controllers
    for (int i = 0; i < _controllers!.length; i++) {
      _controllers![i].addListener(() {
        if (_controllers![i].text.isNotEmpty) {
          if (i < _controllers!.length - 1) {
            _focusNodes![i].unfocus();
            _focusNodes![i + 1].requestFocus();
          } else {
            _focusNodes![i].unfocus();
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers!) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes!) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (index) => Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: _controllers![index],
            focusNode: _focusNodes![index],
            keyboardType: TextInputType.text,  // Accepts alphanumeric characters
            textInputAction: TextInputAction.next, // Moves to the next field on 'Next' button press
            maxLength: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('OTP Input Widget'),
      ),
      body: Center(
        child: OTPInputWidget(),
      ),
    ),
  ));
}
