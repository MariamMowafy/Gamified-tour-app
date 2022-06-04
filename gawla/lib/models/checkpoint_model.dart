import 'package:gawla/models/data_model.dart';


class CheckpointModel{
  int id;
  dynamic tourModel;
  String name;
  String category;
  String img;
  int time;
  String detailedLocation;
  String location;
   String question;
    String answer1;
    String answer2;
    String answer3;
    int correctAnswer;
    String fact;
    String clue;
  CheckpointModel({
    required this.id,
    required this.tourModel,
    required this.name,
    required this.category,
    required this.img,
    required this.time,
    required this.detailedLocation,
    required this.location,
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.correctAnswer,
    required this.fact,
    required this.clue,

  });

  factory CheckpointModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return CheckpointModel(
      id: json['id'],
      tourModel: json['tour'],
      name: json["name"],
      category: json["category"],
      img: json["cover_photo"],
      time: json["cost"],
      detailedLocation: json["detailed_location"],
      location: json["location"],
      question: json['question'],
      answer1: json["answer1"],
      answer2: json["answer2"],
      answer3: json["answer3"],
      correctAnswer: json["correctAnswer"],
      fact: json["fact"],
      clue: json["clue"],
    );
  } //string : as the data types, dynamic: as the data of these types

}