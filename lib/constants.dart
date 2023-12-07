import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

const libraPrimary = Color(0xff1b1725);
const libraBlue = Color(0xff226ce0);
const libraLight = Color(0xffd0bcd5);
const bodyText1 = Color(0xffffffff);
const bodyText2 = Color(0xffffffff);
const clay = Color(0xffa499b3);


const hostName = "https://libra.teamalfy.co.uk";
const hostNameIP = "http://3.10.228.186";
const socketHostName = "wss://libra.teamalfy.co.uk";


Future<String?> getApiPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("API_Key");
}



Future<String?> getUserIDPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("USER_ID");
}



class PasteTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow pasting of text by returning the new value unchanged
    return newValue;
  }
}



bool isAmountValid(String amount) {
  try {
    final intAmount = double.parse(amount);
    return intAmount >= 1 && intAmount <= 1000000000000;
  } catch (e) {
    return false;
  }
}


