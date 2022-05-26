import 'package:flutter/material.dart';
import 'package:gawla/widgets/responsive_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'navigation_page.dart';
class fact extends StatelessWidget {
  const fact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:50,bottom: 50),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 600,
            color: Colors.grey[100],
            child:
          
          Column(
          children:[
              SizedBox(height:70),
              Text('correct or not correct',
              textAlign: TextAlign.right,
             ),
             SizedBox(height:30),
             Text('did you know?',
              textAlign: TextAlign.right,
             ),
             SizedBox(height:30),
             Text('did u know that kaaza bla bla bla',
              textAlign: TextAlign.right,
             ),
              // Container(
              //   width: 600,
              //   height: 400,
              //   child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(30,20)),  )
              // ),
             
              SizedBox(height:10),
              
                
                    GestureDetector(
                                         onTap: (){
                                            // BlocProvider.of<Cubits>(context).goHome();
                                           Navigator.push(context, MaterialPageRoute(builder: ((context) => const nav())));
                                         },
                                         child: Container(
                                             width: 100,
                                             alignment: Alignment.center,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 ResponsiveButton(text:'nav',width: 100,),
                                               ],
                                             )),
                                       ),
                  ],
                ),
              
          
          ),
        )),
      );
  }
  }