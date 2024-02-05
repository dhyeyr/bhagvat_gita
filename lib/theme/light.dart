import 'package:flutter/material.dart';

ThemeData light = ThemeData.light().copyWith(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Colors.black,  fontSize: 20),
    bodyLarge: TextStyle(
      fontSize:15,
      color: Colors.black,
    ),
      bodyMedium: TextStyle(color: Colors.blueAccent)
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      );
    },
  ),
  // iconButtonTheme: IconButtonThemeData(
  //   style: ButtonStyle(
  //     elevation: MaterialStatePropertyAll(2),
  //   ),
  // ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
  ),
);
