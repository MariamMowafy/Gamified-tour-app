import 'dart:convert';

import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class checkpoints_provider with ChangeNotifier{
   late List<CheckpointModel> checkpointsList ;
   int index = 0;
   int index1=1;
   bool flag=false;
  // external String toString();
   
    // Future <void> fetchquestions()async {
    // print('fetch questions');
    // final url = Uri.parse('http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tour/1/checkpoint/$index1/question');
   
    //   final response = await http.get(url);
    //   print(response);      
    //   final extractedData = json.decode(response.body) ;
    //  print(extractedData); 
    //   if(extractedData == null){
    //     return ;
    //   }
    //  // final List<QuestionsModel> loadedquestions = [];
      
    //  // print(loadedquestions);
    //   questionsList=extractedData;
    //    notifyListeners();
    //   }
  Future <void> fetchProducts() async {
    //bool flag = false;
   
    print('fetch checkpoints');

    await fetchquestions();
    final url = Uri.parse('http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tour/1/checkpoints');
   
      final response = await http.get(url);
            
      final extractedData2 = json.decode(response.body) ;
     
      if(extractedData2 == null){
        return ;
      }
      final List<CheckpointModel> loadedCheckpoints = [];
      extractedData2.forEach((prodData){
         try{
        loadedCheckpoints.add(CheckpointModel.fromJson(
          prodData
        )
        );
      }
        catch(error){
          print(error);
        } 
      });
      print(loadedCheckpoints);
      checkpointsList=loadedCheckpoints;
      /// questionsList =  QuestionsModel.fromJson(extractedData);
      // questionsList =  QuestionsModel.fromJson(extractedData);
      flag = true;
     print(flag);
       notifyListeners();
      }
   
      
      void nextCheckpoint(){
          index++;
          index1++;
          notifyListeners();
      }
      void resetCheckpoint(){
        index=0;
        notifyListeners();
      }

       Future <QuestionsModel> fetchquestions()async {
    print('fetch questions');
    final url = Uri.parse('http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tour/1/checkpoint/$index1/question');
   
      final response = await http.get(url);
      print(response);      
      final Map<String,dynamic> extractedData = Map<String,dynamic>.from(json.decode(response.body) );
      return  QuestionsModel.fromJson(extractedData);
     
      print(QuestionsModel.fromJson(extractedData).toString());
      // questionsList =  QuestionsModel.fromJson(extractedData);  
       //questionsList =  QuestionsModel.fromJson(extractedData);
      // return questionsList;

      }
      
      }
      