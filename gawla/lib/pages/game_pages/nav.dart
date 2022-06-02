import 'package:flutter/material.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/game_pages/navigation_page.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/providers/checkpoints_provider.dart';
import 'package:gawla/widgets/checkpoint.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/responsive_button.dart';
import '../navPages/done.dart';

class Nav extends StatelessWidget {
  final index;
  const Nav({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

   checkpoints_provider().fetchProducts();
    late checkpoints_provider checkpoints = Provider.of<checkpoints_provider>(context);
    late int checkpointindex = checkpoints_provider().index;
    
           return  FutureBuilder(
          future: checkpoints_provider().fetchquestions(index),
          
          //checkpoints_provider().fetchProducts(), 
            builder: (context,snapshot) {
            
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(index<3) {
              print('el taht da el snapshot.data');
              print(snapshot.data);
              QuestionsModel question = snapshot.data as QuestionsModel;
              return Scaffold(
      body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children:[
                SizedBox(height:70),
                Text('Tour name',
                textAlign: TextAlign.center,
               ),
               SizedBox(height:30),
                Container(
                  width: 600,
                  height: 400,
                  child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Container( 
                  alignment: Alignment.center,
                  height:500,
                  width: 500,
                  
                  child: 
                GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(30,31)),)
                   
                  ),
              ),
                ),
                ResponsiveButton(text: 'arrived',width:100,),
                SizedBox(height:10),
                Container(
                  width: 600,
                  height: 250,
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                     Text(question.clue),
                      SizedBox(height:10),
                     Text(question.answer1),
                      SizedBox(height:10),
                      Text('press arrived to check your location!'),
                      SizedBox(height:10),
                      Text('points: 0'),
                      GestureDetector(
                                           onTap: (){
                                              // BlocProvider.of<Cubits>(context).goHome();
                                             Navigator.push(context, MaterialPageRoute(builder: ((context) => quest(question: question,index: index,))));
                                           },
                                           child: Container(
                                               width: 100,
                                               alignment: Alignment.center,
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   ResponsiveButton(text:'question',width: 100,),
                                                 ],
                                               )),
                                         ),
                    ],
                  ),
                ),
                 
            ]
        ),
          ),
    );
              // if(checkpoints_provider().flag==true){
   }
   else{
     Future.delayed(Duration.zero, () async {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => const done())));
});
    
     return SizedBox();
   }
   
   
            
             //   return Nav();
              // }
              // else return const Center(
              //   child: CircularProgressIndicator(),
                  // );
            
  });

}

}

