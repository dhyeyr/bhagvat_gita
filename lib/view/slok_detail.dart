// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShlokDetail extends StatefulWidget {
  String? eng;
  String? hindi;
  String? guj;
  String? san;

  ShlokDetail(
      {Key? key,
      required this.eng,
      required this.hindi,
      required this.guj,
      required this.san})
      : super(key: key);

  @override
  State<ShlokDetail> createState() => _ShlokDetailState();
}

class _ShlokDetailState extends State<ShlokDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.grey[400],
      appBar: AppBar(
        title: Text("Verses Details"),
        centerTitle: true,
        backgroundColor:  Theme.of(context).brightness == Brightness.light
          ? Color(0xFFCCAB8C)
          : Color(0xFF946D4A),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: double.infinity,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Text("SANSKRIT :", style: TextStyle(fontSize: 18)),
                )),
            Container(
                width: MediaQuery.sizeOf(context).width * 10,
                height: MediaQuery.sizeOf(context).height * 0.15,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                child: Center(
                    child: Text(
                  widget.san ?? "",
                  style: TextStyle(fontSize: 18),
                ))),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: double.infinity,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Text("ENGLISH :", style: TextStyle(fontSize: 18)),
                )),
            Container(
                width: MediaQuery.sizeOf(context).width * 10,
                height: MediaQuery.sizeOf(context).height * 0.15,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                child: Center(
                    child: Text(
                  widget.eng ?? "",
                  style: TextStyle(fontSize: 18),
                ))), Container(
              margin: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: double.infinity,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Text("HINDI :", style: TextStyle(fontSize: 18)),
                )),
            Container(
                width: MediaQuery.sizeOf(context).width * 10,
                height: MediaQuery.sizeOf(context).height * 0.15,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                child: Center(
                    child: Text(
                  widget.hindi ?? "",
                  style: TextStyle(fontSize: 18),
                ))), Container(
              margin: EdgeInsets.only(left: 10,right: 10),
                height: 50,
                width: double.infinity,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Text("GUJARATI :", style: TextStyle(fontSize: 18)),
                )),
            Container(
                width: MediaQuery.sizeOf(context).width * 10,
                height: MediaQuery.sizeOf(context).height * 0.15,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color(0xFFCCAB8C)
                    : Color(0xFF946D4A),
                margin: EdgeInsetsDirectional.all(8),
                padding: EdgeInsetsDirectional.all(8),
                child: Center(
                    child: Text(
                  widget.guj ?? "",
                  style: TextStyle(fontSize: 18),
                ))),

          ],
        ),
      ),
    );
  }
}
