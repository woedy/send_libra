import 'package:flutter/material.dart';

import '../../constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: libraPrimary,
    fontFamily: "Montserrat",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}


TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: bodyText1),
    bodyText2: TextStyle(color: bodyText2),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: libraPrimary,
    elevation: 0
  );
}