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
  CheckpointModel({
    required this.id,
    required this.tourModel,
    required this.name,
    required this.category,
    required this.img,
    required this.time,
    required this.detailedLocation,
    required this.location,

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

    );
  } //string : as the data types, dynamic: as the data of these types

}