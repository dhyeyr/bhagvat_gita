
import 'dart:convert';

List<AllChapter> allChapterFromJson(String str) => List<AllChapter>.from(json.decode(str).map((x) => AllChapter.fromJson(x)));

String allChapterToJson(List<AllChapter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllChapter {
  int? chapterNumber;
  String? chapterSummary;
  String? chapterSummaryHindi;
  int? id;
  String? imageName;
  String? name;
  String? nameMeaning;
  String? nameTranslation;
  int? versesCount;
  String? jsonPath;
  List<Verse>? verses;


  AllChapter({
    this.chapterNumber,
    this.chapterSummary,
    this.chapterSummaryHindi,
    this.id,
    this.imageName,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.versesCount,
    this.jsonPath,
    this.verses,

  });

  factory AllChapter.fromJson(Map<String, dynamic> json) => AllChapter(
    chapterNumber: json["chapter_number"],
    chapterSummary: json["chapter_summary"],
    chapterSummaryHindi: json["chapter_summary_hindi"],
    id: json["id"],
    imageName: json["image_name"],
    name: json["name"],
    nameMeaning: json["name_meaning"],
    nameTranslation: json["name_translation"],
    versesCount: json["verses_count"],
    jsonPath: json["json_path"],
    verses: json["verses"] == null ? [] : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chapter_number": chapterNumber,
    "chapter_summary": chapterSummary,
    "chapter_summary_hindi": chapterSummaryHindi,
    "id": id,
    "image_name": imageName,
    "name": name,
    "name_meaning": nameMeaning,
    "name_translation": nameTranslation,
    "verses_count": versesCount,
    "json_path": jsonPath,
    "verses": verses == null ? [] : List<dynamic>.from(verses!.map((x) => x.toJson())),
  };
}

class Verse {
  String? verse;
  String? san;
  String? en;
  String? guj;
  String? hi;

  Verse({
    this.verse,
    this.san,
    this.en,
    this.guj,
    this.hi,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
    verse: json["verse"],
    san: json["san"],
    en: json["en"],
    guj: json["guj"],
    hi: json["hi"],
  );

  Map<String, dynamic> toJson() => {
    "verse": verse,
    "san": san,
    "en": en,
    "guj": guj,
    "hi": hi,
  };
}
