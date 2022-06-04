import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/navPages/done.dart';
import 'package:gawla/pages/newgamepages/newquestion.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/responsive_button.dart';

class locationpage extends StatelessWidget {
  final index;
  final checkpoints;
  final length;
  final question;
  const locationpage({Key? key, required this.index, required this.length, required List<CheckpointModel> this.checkpoints, required List<QuestionsModel> this.question,}) : super(key: key);
 



  @override
  Widget build(BuildContext context) {
  while(index<length){
        print('inside loop');

  Future<Position> _determinePosition()async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

    return Scaffold(
      body: Column(
        children: [
          Padding(
            
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 500,
              height: 500,
        
              child:GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(target: LatLng(31, 31)),
       

      ),),
          ),
          ElevatedButton(onPressed:()async{
                      Position position = await _determinePosition();
                      var lat = position.latitude.toString();
                      var long = position.longitude.toString();
                      var latsub = lat.substring(0,7);
                      var longsub = long.substring(0,7);
                      if(lat.contains(latsub)){
                      print(position.latitude);
                      print(lat);
                      print(latsub);
                      }
                      if(long.contains(longsub)){
                      print(position.longitude);
                      print(long);
                      print(longsub);}

                    }, child: Text('Get Location'),),
          Text(checkpoints[index].name),
          Text(checkpoints[index].answer1),
          // Text(c),
          GestureDetector(
                                       onTap: () async {
                                          // BlocProvider.of<Cubits>(context).goHome();
                                         //BlocProvider.of<Cubits>(context).game(detail.tour);
                                       // var newi = newindex++;
                                        //incrementindex();
                                        print(index);
                                         Navigator.push(context, MaterialPageRoute(builder: ((context) => newquest(index: index,length:length,checkpoints: checkpoints,question:question)))); },
                                       child: Container(
                                           width: 100,
                                           child: Row(
                                             children: [
                                               ResponsiveButton(text:'next',width: 100,),
                                             ],
                                           )),
                                     ),

        ],
      )
    );}

                                       
    return done();
  }
}