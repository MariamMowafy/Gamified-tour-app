import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/questions_model.dart';


class QuestionsModel{
    String question;
    String answer1;
    String answer2;
    String answer3;
    int correctAnswer;
    String fact;
    String clue;
    dynamic TourModel;
    dynamic CheckpointModel;

  QuestionsModel({
    required this.question,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.correctAnswer,
    required this.fact,
    required this.clue,
    required this.TourModel,
    required this.CheckpointModel,
});

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return QuestionsModel(
      question: json['question'],
      TourModel: json['tour'],
      CheckpointModel: json['checkpoint'],
      answer1: json["answer1"],
      answer2: json["answer2"],
      answer3: json["answer3"],
      correctAnswer: json["correctAnswer"],
      fact: json["fact"],
      clue: json["clue"],

    );
  } //string : as the data types, dynamic: as the data of these types

}