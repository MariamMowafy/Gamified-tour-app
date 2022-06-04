// import 'dart:async';
// import 'dart:typed_data';

// import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gawla/models/checkpoint_model.dart';
// import 'package:gawla/models/questions_model.dart';
// import 'package:gawla/pages/newgamepages/newquestion.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// import '../../cubit/cubit_states.dart';
// import '../../cubit/cubits.dart';
// import '../../widgets/responsive_button.dart';
// class maptrial extends StatelessWidget {
//   late StreamSubscription _locationSubscription;
//   final Location _locationTracker = Location();
//   late  Marker marker;
//   late Circle circle;
//   late GoogleMapController _controller;

//   static final CameraPosition initialLocation = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

 
//   void getCurrentLocation() async {
//     try {

//       //Uint8List imageData = await getMarker();
//       var location = await _locationTracker.getLocation();

//      // updateMarkerAndCircle(location, imageData);

//       if (_locationSubscription != null) {
//         _locationSubscription.cancel();
//       }


//       _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
//         if (_controller != null) {
//           _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//               bearing: 192.8334901395799,
//               target: LatLng(newLocalData.latitude, newLocalData.longitude),
//               tilt: 0,
//               zoom: 18.00)));
//        //   updateMarkerAndCircle(newLocalData, imageData);
//         }
//       });

//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         debugPrint("Permission Denied");
//       }
//     }
//   }

//   @override


//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('title'),
//       ),
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: initialLocation,
//         markers: Set.of((marker != null) ? [marker] : []),
//         circles: Set.of((circle != null) ? [circle] : []),
//         onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//         },

//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.location_searching),
//           onPressed: () {
//             getCurrentLocation();
//           }),
//     );
//   }
// }