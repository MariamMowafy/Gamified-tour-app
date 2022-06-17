import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:gawla/pages/newgamepages/newfact.dart';
import 'package:gawla/pages/newgamepages/newnav.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/responsive_button.dart';

class newquest extends StatelessWidget {
  final index;
  final checkpoints;
  final length;
  final question;
  final points;
  const newquest({Key? key, required this.index, required this.checkpoints, required this.length, required this.question, this.points}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    var newpoints = points;
return Scaffold(
      body: Column(
        children: [
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
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(primary:AppColors.mainColor),
          //   onPressed:()async{
          //             // Position position = await _determinePosition();
          //             var lat = position.latitude.toString();
          //             var long = position.longitude.toString();
          //             var latsub = lat.substring(0,7);
          //             var longsub = long.substring(0,7);
          //             if(lat.contains(latsub)){
          //             print(position.latitude);
          //             print(lat);
          //             print(latsub);
          //             }
          //             if(long.contains(longsub)){
          //             print(position.longitude);
          //             print(long);
          //             print(longsub);}

          //           }, 
          // child: Text('Get Location'),),
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
            padding: const EdgeInsets.all(8.0),
            child: Container( alignment: Alignment.topLeft,child: Text('Correct! +10 points!',style:TextStyle(fontFamily: 'ubuntu',fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 71, 212, 75)) ,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( alignment: Alignment.topLeft,child: Text('POP QUESTION',style:TextStyle(fontFamily: 'ubuntu',fontSize: 15,fontWeight: FontWeight.bold,) ),),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( alignment: Alignment.topLeft,child: Text(checkpoints[index].question,style:TextStyle(fontFamily: 'ubuntu',fontSize: 15,color: Color.fromARGB(255, 106, 106, 106)) )),
          ),
         
         
         
                    Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              GestureDetector(
            onTap: () async {
              print('tapped');
              if(checkpoints[index].correctAnswer==0){
                newpoints+=10;
               print('points: ' + newpoints.toString());
               Navigator.push(context, MaterialPageRoute(builder: ((context) => newfact(index: index, checkpoints: checkpoints,length: length,question: question,points: newpoints))));
              }// addpoints();
              // printpoints();
              // print(newpoints.toString());
               },
            child: Text('a. '+checkpoints[index].answer1,style: TextStyle( fontSize:18,fontFamily: 'ubuntu',fontWeight: FontWeight.bold),),
        ),
             
              SizedBox(width: 10,),
              GestureDetector(
            onTap: () async {
              print('tapped');
               if(checkpoints[index].correctAnswer==1){
                 newpoints+=10;
                print('points: ' + newpoints.toString());
               Navigator.push(context, MaterialPageRoute(builder: ((context) => newfact(index: index, checkpoints: checkpoints,length: length,question: question,points: newpoints))));
              }
              //widget.points = widget.points+1;
               },
            child:  Text('b. '+checkpoints[index].answer2,style: TextStyle( fontSize:18,fontWeight: FontWeight.bold,
                                 fontFamily: 'ubuntu',),),
        ),
             
                SizedBox(width: 10,),
                 GestureDetector(
            onTap: () async {
              print('tapped');
 if(checkpoints[index].correctAnswer==2){
   newpoints+=10;
                print('points: ' + newpoints.toString());
               Navigator.push(context, MaterialPageRoute(builder: ((context) => newfact(index: index, checkpoints: checkpoints,length: length,question: question,points: newpoints,))));
              }               },
            child:      Text('c. '+checkpoints[index].answer3,style: TextStyle( fontSize:18,
                                 fontFamily: 'ubuntu',fontWeight: FontWeight.bold,),),
        ),
        
            ],),
          ),
         // Text('Pin point your current location to know if you  have arrived!'),
          //Text(printpoints().toString()),
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
              ],
            ),
          ),
          SizedBox(height: 10,),
         GestureDetector(
              onTap: () async {
                // BlocProvider.of<Cubits>(context).goHome();
                //BlocProvider.of<Cubits>(context).game(detail.tour);
              // var newi = newindex++;
              //incrementindex();
              print(index);
                Navigator.push(context, MaterialPageRoute(builder: ((context) => newfact(index: index, checkpoints: checkpoints,length: length,question: question,points: newpoints))));
//                                          Timer(Duration(seconds: 5), () { // <-- Delay here
//   setState(() {

//      BlocProvider.of<Cubits>(context).newnave(index: newindex); // <-- Code run after delay
//   });
// });
              
              },
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
    );












    
//     return  GestureDetector(
//                                        onTap: () async {
//                                           // BlocProvider.of<Cubits>(context).goHome();
//                                          //BlocProvider.of<Cubits>(context).game(detail.tour);
//                                        // var newi = newindex++;
//                                         //incrementindex();
//                                         print(index);
//                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => locationpage(index: index+1, checkpoints: checkpoints,length: length,question: question,))));
// //                                          Timer(Duration(seconds: 5), () { // <-- Delay here
// //   setState(() {
    
// //      BlocProvider.of<Cubits>(context).newnave(index: newindex); // <-- Code run after delay
// //   });
// // });
                                       
//                                        },
//                                        child: Container(
//                                            width: 100,
//                                            child: Row(
//                                              children: [
//                                                ResponsiveButton(text:'next',width: 100,),
//                                              ],
//                                            )),
//                                      );
  
  }
}