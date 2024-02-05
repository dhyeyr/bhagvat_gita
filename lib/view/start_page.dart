import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home_screen.dart';

class Start_page extends StatelessWidget {
  const Start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/back.png",
              fit: BoxFit.cover,
            )),
        Positioned(
          top: 200,
          left: 105,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Home_Screen();
                  },
                ),
              );
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 65,
              width: 180,
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Color(0xFFA09183),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                "Start",
                style: TextStyle(
                    color: Color(0xFF5F4D40),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ) ,

      ]),
    );
  }
}
