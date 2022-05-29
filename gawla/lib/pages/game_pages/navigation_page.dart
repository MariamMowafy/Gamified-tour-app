import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/game_pages/nav.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/widgets/responsive_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:gawla/providers/checkpoints_provider.dart';
import 'package:provider/provider.dart';

class nav extends StatelessWidget {
  
   const nav({Key? key}) : super(key: key);


  //   Future fetchquestions()async {
  //   final urlindex = checkpoints_provider().index1;
  //   print(urlindex);
  //   print('fetch questions');
  //   final url = Uri.parse('http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tour/1/checkpoint/$urlindex/question');
  
  //     final response = await http.get(url);
  //     print(response);      
  //     final extractedData = json.decode(response.body) ;
  //     print(response.body);
  //     if(extractedData == null){
  //       return ;
  //     }
      
  //    // print(loadedquestions);
  //    return extractedData;
  //     }
      
  // Future fetchProducts()async {
  //   print('fetch checkpoints');
  //   final url = Uri.parse('http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tour/1/checkpoints');
   
  //     final response = await http.get(url);
  //     //print(response);      
  //     final extractedData = json.decode(response.body) ;
     
  //     if(extractedData == null){
  //       return ;
  //     }
  //     final List<CheckpointModel> loadedCheckpoints = [];
  //     extractedData.forEach((prodData){
      
  //        try{
  //       loadedCheckpoints.add(CheckpointModel.fromJson(
  //         prodData
  //       ));}
  //       catch(error){
  //         print(error);
  //       }
        
  //     });
  //     print(loadedCheckpoints);
  //     return loadedCheckpoints;}

 
  
  @override
  Widget build(BuildContext context) {
    late checkpoints_provider checkpoints = Provider.of<checkpoints_provider>(context, listen: true);
    checkpoints_provider().fetchProducts();
    
    //var questions = fetchquestions();
    print(checkpoints);
          return Scaffold(
          body: 
          FutureBuilder(
          future: checkpoints_provider().fetchProducts(),
          
          //checkpoints_provider().fetchProducts(), 
            builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              return Nav();
              // if(checkpoints_provider().flag==true){
              //   return Nav();
              // }
              // else return const Center(
              //   child: CircularProgressIndicator(),
              // );
            
              
            }}),
            

          );

          
          

  }}


    // return FutureBuilder(
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  },
    //   child: Scaffold(
    //     body: Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Column(
    //       children:[
    //           SizedBox(height:70),
    //           Text('Tour name',
    //           textAlign: TextAlign.center,
    //          ),
    //          SizedBox(height:30),
    //           Container(
    //             width: 600,
    //             height: 400,
    //             child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(30,20)),  )
    //           ),
    //           ResponsiveButton(text: 'arrived',width:100,),
    //           SizedBox(height:10),
    //           Container(
    //             width: 600,
    //             height: 250,
    //             color: Colors.grey[100],
    //             child: Column(
    //               children: [
    //                 Text('Clue 1'),
    //                 SizedBox(height:10),
    //                 Text('Clue description'),
    //                 SizedBox(height:10),
    //                 Text('press arrived to check your location!'),
    //                 SizedBox(height:10),
    //                 Text('points: 0'),
    //                 GestureDetector(
    //                                      onTap: (){
    //                                         // BlocProvider.of<Cubits>(context).goHome();
    //                                        Navigator.push(context, MaterialPageRoute(builder: ((context) => const quest())));
    //                                      },
    //                                      child: Container(
    //                                          width: 100,
    //                                          alignment: Alignment.center,
    //                                          child: Row(
    //                                            mainAxisAlignment: MainAxisAlignment.center,
    //                                            children: [
    //                                              ResponsiveButton(text:'question',width: 100,),
    //                                            ],
    //                                          )),
    //                                    ),
    //               ],
    //             ),
    //           ),
               
    //       ]
    //   ),
    //     )),
    // );
  // }


  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
//}
