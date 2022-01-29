import 'package:flutter/material.dart';

ThemeData globalTheme()=> ThemeData(
fontFamily: "Georgia",
splashColor: Colors.purpleAccent,

colorScheme: ColorScheme.fromSwatch(
brightness: Brightness.light,
primarySwatch: Colors.red,
).copyWith(
secondary: Colors.green,
),

textTheme: const TextTheme(
headline1: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
headline6: TextStyle(fontSize: 30, color: Colors.amber, fontStyle: FontStyle.italic),
bodyText2: TextStyle(fontSize: 22, fontFamily: "Hind", color: Colors.blueGrey),

),
);