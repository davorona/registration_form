

import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  fontFamily: 'Iceland',
  splashColor: Colors.grey,

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
  ).copyWith(
    secondary: Colors.blueGrey,
  ),

  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.black87),
  )
);