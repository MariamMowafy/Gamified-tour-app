import 'package:gawla/models/data_model.dart';

class TourModel{
  int id;
  dynamic tourCreator;
  String name;
  String category;
  String img;
  int price;
  //int? checkpoints;
  int? stars;
  String description;
  String location;
  int maxParticipants;
  int visitorsJoined;
  TourModel({
    required this.id,
    required this.tourCreator,
    required this.name,
    required this.category,
    required this.img,
    required this.price,
    //this.checkpoints,
    this.stars,
    required this.description,
    required this.location,
    required this.maxParticipants,
    required this.visitorsJoined

});

  factory TourModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return TourModel(
      id: json['id'],
      name: json["name"],
      category: json["category"],
      img: json["cover_photo"],
      price: json["cost"],
      //checkpoints: json["checkpoints"],
      //stars: json["stars"],
      description: json["description"],
      location: json["location"],
      visitorsJoined: json["visitors_joined"],
      tourCreator: json["tour_creator"],
      maxParticipants: json["max_participants"],

    );
  } //string : as the data types, dynamic: as the data of these types

}