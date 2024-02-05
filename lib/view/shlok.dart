// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bhagvat_gita/view/slok_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controller/json_decod_pro.dart';
import '../model/all_chapter.dart';

class DetailPage extends StatefulWidget {
  int chapterNumber;
  String? chapter_summary;
  String? name;
  String? json_path;
  String? img_path;
  List<Verse>? verses = [];

  DetailPage(
      {Key? key,
      required this.chapterNumber,
      required this.chapter_summary,
      required this.img_path,
      required this.name,
      required this.verses,
      required this.json_path})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    if (widget.verses == null) {
      print("NULL");
    } else {
      print("${widget.verses!.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gp = Provider.of<GeetaProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.grey[400],
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),

          Stack(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image.asset(
                    'assets/${widget.img_path}.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    )),
              ),
            ],
          ),

          SizedBox(height: 10),
          Consumer<GeetaProvider>(
            builder:
                (BuildContext context, GeetaProvider value, Widget? child) {
              return Container(
                margin: EdgeInsetsDirectional.only(top: 8, end: 20, start: 20),
                child: Text(

                  "${widget.chapter_summary}",style: TextStyle(color: Colors.black),
                  maxLines: (value.showMore == true) ? null : 4,
                  overflow:
                      (value.showMore == true) ? null : TextOverflow.ellipsis,
                ),
              );
            },
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (gp.showMore == false) {
                    gp.sMore();
                  } else {
                    gp.sLess();
                  }
                },
                child: Consumer<GeetaProvider>(
                  builder: (BuildContext context, GeetaProvider value,
                      Widget? child) {
                    return Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 8, end: 20, start: 20),
                      child: (gp.showMore == false)
                          ? Text("SHOW MORE",
                              style: TextStyle(color: Colors.black))
                          : Text("SHOW LESS",
                              style: TextStyle(color: Colors.black)),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 20,
            borderColor:[Theme.of(context).brightness == Brightness.light
              ? Color(0xFFCCAB8C)
              :Color(0xFF946D4A)],
            activeBgColor: [Colors.black26],
            labels: ['English', 'Gujrati', 'Sanskrit', 'Hindi'],
            onToggle: (val) {
              gp.setToogleIndex(val);
            },
          ),

          Expanded(
            child: Consumer<GeetaProvider>(
              builder:
                  (BuildContext context, GeetaProvider value, Widget? child) {
                return ListView.builder(
                  itemCount: widget.verses?.length,
                  itemBuilder: (context, index) {
                    var sample = widget.verses?[index];
                    String title = sample!.en ?? "";
                    String v = "Verse";
                    String en = "Chapter";

                    if (value.toggleIndex == 1) {
                      title = sample.guj ?? "";
                      en = "પ્રકરણ";
                      v = "શ્લોક";
                    } else if (value.toggleIndex == 2) {
                      title = sample.san ?? "";
                      v = "श्लोकः";
                      en = "अध्यायः";
                    } else if (value.toggleIndex == 3) {
                      title = sample.hi ?? "";
                      v = "श्लोक";
                      en = "अध्याय";
                    }
                    return Column(
                      children: [
                        ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ShlokDetail(
                                    guj: sample.guj ?? "",
                                    eng: sample.en ?? "",
                                    hindi: sample.hi,
                                    san: sample.san ?? "",
                                  );
                                },
                              ));
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? Color(0xFFCCAB8C)
                                      :Color(0xFF946D4A),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "$en ${widget.chapterNumber} - ${widget.name} ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,color: Colors.black),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? Color(0xFFCCAB8C)
                                      :Color(0xFF946D4A),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "$v ${sample.verse}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            subtitle: Text(title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,color: Colors.black))),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
