import 'dart:async';

import 'package:flutter/services.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/navPages/done.dart';
import 'package:gawla/pages/newgamepages/newquestion.dart';
import 'package:gawla/widgets/checkpoint.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/responsive_button.dart';

class locationpage extends StatefulWidget {
  final index;
  final checkpoints;
  final length;
  final question;

  const locationpage({Key? key, required this.index, required this.length, required List<CheckpointModel> this.checkpoints, required List<QuestionsModel> this.question, this.points,}) : super(key: key);

  @override
    final points;
    
  State<locationpage> createState() => _locationpageState();
}

class _locationpageState extends State<locationpage> {

  @override
late GoogleMapController mapController;
var  locationSubscription;
Location location = new Location();
LatLng _initialPosition = LatLng(37.42796133588664, -122.885740655967);
void _onMapCreated(GoogleMapController _cntrl) async {
mapController = await _cntrl;
var _location;
locationSubscription = _location.onLocationChanged.listen((l)  {
  mapController.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 18)),
);});}
    Widget build(BuildContext context) {
        
 var  newpoints = widget.points;


      while(widget.index<widget.length){
        print('inside loop');
        return Scaffold(
      body: Column(
        children: [
      //      GoogleMap(
      // initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 10),
      // mapType: MapType.normal,
      // onMapCreated: _onMapCreated,
      // myLocationEnabled: true,
      // myLocationButtonEnabled: true,
      // zoomControlsEnabled: false,

      // ),
          Padding(
            
            padding: const EdgeInsets.only(left:50.0,right:50,top:80,bottom: 10),
            child: SizedBox(
              width: 500,
              height: 400,
        
              child:GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(29.9867436,31.4390878), zoom: 17.5,
      //  onMapCreated: (GoogleMapController controller){
      //    _controller = controller;
      //  },
      
      ),),
          ),),
          //ElevatedButton(onPressed: getCurrentLocation, child: Icon(Icons.location_searching)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary:AppColors.mainColor),
            onPressed:()async{
                      Position position = await _determinePosition();
                      var lat = position.latitude.toString();
                      var long = position.longitude.toString();
                      var latsub = lat.substring(0,7);
                      var longsub = long.substring(0,7);
                      var latcheckpoint = widget.checkpoints[widget.index].location.toString().substring(0,7);
                      var longcheckpoint = widget.checkpoints[widget.index].location.toString().substring(8,15);
                      if(lat.contains(latsub)){
                     // print(position.latitude);
                      //print(lat);
                      print(latsub);
                      }
                      if(long.contains(longsub)){
                     // print(position.longitude);
                     // print(long);
                      print(longsub);}
                      print(latcheckpoint);
                      print(longcheckpoint);
                     if(latsub!=latcheckpoint && longsub!=longcheckpoint){
                      newpoints+=10;
                      print('points: ' + newpoints.toString());
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => newquest(index: widget.index,length:widget.length,checkpoints: widget.checkpoints,question:widget.question,points:newpoints)))); 
                     }
                    }, 
          child: Text('Get Location'),),
          Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                            Radius.circular(20),
                            
                        ),
                        color: Colors.grey[200],
            ),
            
            height: 175,
            width: MediaQuery. of(context). size. width /1.25,
            child: Column(
              children: [
                
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Clue '+ (widget.index +1).toString(),style: 
            TextStyle(fontWeight:FontWeight.bold , fontSize: 20,fontFamily: 'ubuntu'),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.checkpoints[widget.index].clue,style: TextStyle(fontSize: 17,fontFamily: 'ubuntu',color: Color.fromARGB(255, 106, 106, 106)),),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(widget.checkpoints[widget.index].clue),
          // ),
          Text('Pin point your current location to know if you  have arrived!',textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontFamily: 'ubuntu',color: Colors.redAccent)),
                  //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //       GestureDetector(
        //     onTap: () async {
        //       print('tapped');
        //       addpoints();
        //       printpoints();
        //       print(newpoints.toString());
        //        },
        //     child: Text('a. '+widget.checkpoints[widget.index].answer1,style: TextStyle( fontSize:20,
        //                          fontFamily: 'ubuntu',),),
        // ),
             
        //       SizedBox(width: 10,),
        //       GestureDetector(
        //     onTap: () async {
        //       print('tapped');
        //       //widget.points = widget.points+1;
        //        },
        //     child:  Text('b. '+widget.checkpoints[widget.index].answer2,style: TextStyle( fontSize:20,
        //                          fontFamily: 'ubuntu',),),
        // ),
             
        //         SizedBox(width: 10,),
        //          GestureDetector(
        //     onTap: () async {
        //       print('tapped');
        //        },
        //     child:      Text('c. '+widget.checkpoints[widget.index].answer3,style: TextStyle( fontSize:20,
        //                          fontFamily: 'ubuntu',),),
        // ),
        
        //     ],),
        //   )
          //Text(printpoints().toString()),

              ],
            ),
          ),
          SizedBox(height: 10,),
         // Text(newpoints.toString()),
          GestureDetector(
          onTap: () async {
              // BlocProvider.of<Cubits>(context).goHome();
            //BlocProvider.of<Cubits>(context).game(detail.tour);
          // var newi = newindex++;
            //incrementindex();
            print(widget.index);
            newpoints+=0;
            Navigator.push(context, MaterialPageRoute(builder: ((context) => newquest(index: widget.index,length:widget.length,checkpoints: widget.checkpoints,question:widget.question,points:newpoints)))); },
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

                                       
    return done(points: newpoints);
  }
}
        //  late StreamSubscription _locationSubscription;
//   late Circle circle;
//     Location _locationTracker = Location();
//   CameraPosition initiallocation = CameraPosition(target: LatLng(29.9868095, 31.4390711), zoom: 14.5);
//   late GoogleMapController _controller;
  // void getCurrentLocation() async{
    
  //   try{
  //     var location = await _locationTracker.getLocation();
  //     updateCircle(location);
  //     if(_locationSubscription!=null){
  //       _locationSubscription.cancel();
  //     }
  //     _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
  //       if(_controller!= null){
  //       _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(target: LatLng(newLocalData.latitude,newLocalData.longitude),zoom: 18)));
  //       updateCircle(newLocalData);
  //     }
  //      });
      
  //   }on PlatformException catch (e){
  //   }
  // }
// void updateCircle(LocationData location){
// LatLng latlng =LatLng(location.latitude, location.longitude);
// this.setState(() {
//   circle = Circle(
//  radius: location.accuracy,
//  zIndex: 1,
//  strokeColor: Colors.blue,
//  center: latlng,
//  fillColor: Colors.blueAccent

//   );
// });
// }



  // void getCurrentLocation() async{
  //   try{
  //     if(_controller!= null){
  //       _controller.animateCamera(cameraUpdate.newCameraPosition(new CameraPosition(target: LatLng(newLocalData.latitude,newLocalData.longitude))))
  //     }
  //   }
  //   catch{

  //   }
  // }
  
 

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

//const _controller;
    