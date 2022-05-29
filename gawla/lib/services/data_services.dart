import 'dart:convert';

import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:http/http.dart' as http;

class DataServices{
  //the below baseUrl is of "laravel backend"
  //from "postman's Uri", beside Dropdown menu Get/Post
  var index;
  String baseUrl = "http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com";//depends on kind of back-end used
  Future<List<DataModel>>getTourguideInfo() async {
    var apiUrl = '/tourCreators';//combined-Uri
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        //print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];

      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
  Future<List<dynamic>>getTourInfo() async {
    var apiUrl = '/tours';//combined-Uri
    var link;
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        //print(list);
        //link =list.map((e) => TourModel.fromJson(e)).toList();
        //print(link);
        return list.map((e) => TourModel.fromJson(e)).toList();//
      }else{
        return <TourModel>[];

      }
    }catch(e){
      print(e);
      return <TourModel>[];
    }
  }
  Future<List<dynamic>>getcheckpoints() async {
    var apiUrl = '/tour/1/checkpoints/';//combined-Uri
    var link;
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        //print(list);
        //link =list.map((e) => TourModel.fromJson(e)).toList();
        //print(link);
        return list.map((e) => CheckpointModel.fromJson(e)).toList();//
      }else{
        return <CheckpointModel>[];

      }
    }catch(e){
      print(e);
      return <CheckpointModel>[];
    }
  }
    Future<List<dynamic>>getcheckpointsquestion() async {
    
    void incrementindex(){
      index++;
    }
    var apiUrl = '/tour/1/checkpoints/$index/question';//combined-Uri
    var link;
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        //print(list);
        //link =list.map((e) => TourModel.fromJson(e)).toList();
        //print(link);
        return list.map((e) => QuestionsModel.fromJson(e)).toList();//
      }else{
        return <QuestionsModel>[];

      }
    }catch(e){
      print(e);
      return <QuestionsModel>[];
    }
  }
  

}