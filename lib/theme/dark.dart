import 'package:flutter/material.dart';

ThemeData dark = ThemeData.dark().copyWith(
  textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      bodyLarge: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),

     bodyMedium:  TextStyle(color: Color(0xFFD9A3E7),fontSize: 15
      )
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.green,
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
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(2),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
  ),
  // primaryContainer: Colors.pink,
);
