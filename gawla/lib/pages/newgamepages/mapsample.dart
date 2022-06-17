// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:gawla/pages/newgamepages/newfact.dart';
// import 'package:gawla/pages/newgamepages/newnav.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// class MapSample extends StatefulWidget {
// @override
// _MapSampleState createState() => _MapSampleState();
// }
// class _MapSampleState extends State<MapSample> {
  
// late GoogleMapController mapController;
// Location location = new Location();
// LatLng _initialPosition = LatLng(37.42796133588664, -122.885740655967);
// void _onMapCreated(GoogleMapController _cntrl) async {
// mapController = await _cntrl;
// locationSubscription = _location.onLocationChanged.listen((l)  {
//   mapController.animateCamera(
//     CameraUpdate.newCameraPosition(
//       CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 18)),
// );});}
// Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(
//   backgroundColor: Color(0xff2758a1),
//   title: Text('Demo'),
//   ),
//   body: Stack(
//     children: <Widget>[
//     GoogleMap(
//       initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 10),
//       mapType: MapType.normal,
//       onMapCreated: _onMapCreated,
//       myLocationEnabled: true,
//       myLocationButtonEnabled: true,
//       zoomControlsEnabled: false,
//       )
//      ],
//    ),
//  );

// }}