import 'package:bhagvat_gita/view/start_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/json_decod_pro.dart';
import 'controller/theme_provider.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool appTheme = prefs.getBool('AppTheme') ?? false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeetaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
          ThemeProvider()
            ..getTheme(),
        ),
      ],
      builder: (context, child) {
        return Consumer <ThemeProvider>(
            builder: (context,themeprovider, child) {
        return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Start_page(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeprovider.thememode,
        );
        }
        );
      },

    );
  }
}
