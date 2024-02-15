import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare - Doctor Conslation App',
      theme: Theme_Data(context),
      home: WelcomeScreen(),
    );
  }

  ThemeData Theme_Data(BuildContext context) {
    OutlineInputBorder TextFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black.withOpacity(0.1)));
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
                padding: EdgeInsets.all(defaultPading),
                backgroundColor: primaryColor)),
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        inputDecorationTheme: InputDecorationTheme(
            border: TextFieldBorder,
            enabledBorder: TextFieldBorder,
            focusedBorder: TextFieldBorder));
  }
}
