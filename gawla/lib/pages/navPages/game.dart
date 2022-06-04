import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/responsive_button.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';



class game extends StatefulWidget {
  game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  @override

 Widget build(BuildContext context) {
   
    return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      gameState detail = state as gameState;
     // List locations = [LatLng(29.9760, 31.1308), LatLng(29.92726, 31.1284),LatLng(29.9753,31.1376),LatLng(29.9716,31.1280)];
      
Future<Position> _determinePosition() async {
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
        body: Container(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Container( 
                  alignment: Alignment.center,
                  height:500,
                  width: 500,
                  
                  child: 
                GoogleMap(
                  initialCameraPosition: CameraPosition(target: LatLng(30,31)),)
                   
                  ),
              ),
              //Text('` text'),
              Padding(
                padding: const EdgeInsets.only(top:165),
                child: Container( 
                  alignment: Alignment.center,
                  // height:200,
                  // width: 200,
                  child: Container(
                    child: ElevatedButton(onPressed:()async{
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

                    },
                    child: Text('Get Location'),),
                  )
                // GoogleMap(
                //   mapType: MapType.hybrid,
                  
                  
                //   initialCameraPosition: initiallocation,
                //    ),
                   
                  ),
              ),
              
            ],

          ),
          
        ),
          
                   );
        });}
}