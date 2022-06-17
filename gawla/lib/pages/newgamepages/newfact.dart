import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:gawla/pages/newgamepages/newnav.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/responsive_button.dart';

class newfact extends StatelessWidget {
  final index;
  final checkpoints;
  final length;
  final question;
  final points;
  const newfact({Key? key, required this.index, required this.checkpoints, required this.length, required this.question, this.points}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    var newpoints = points;

    var text='';
    if(index==checkpoints.length-1){
      text = 'Done';
    }
    else{
      text = 'Next clue!';
    }
                    
return Scaffold(
      body: Column(
        children: [
 Container(
  alignment: Alignment.center,
   child: Padding(
     padding: const EdgeInsets.only(top:80,left:20,right: 20),
     child: Container(
        
                         height: 600,
                         width: 300,
                         decoration: BoxDecoration(
                          // border: Border.all(color: Colors.deepPurpleAccent),
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.all(
                                Radius.circular(30),
                                
                            ),
                           
                         ),
                         //margin:EdgeInsets.only(top: 150) ,
                        child:Container(
                          alignment:Alignment.topLeft,
                          child: Column(
                            children: [
                              //Text(newpoints.toString()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: 
                                Column(
                                  
                                  children:[
                                    SizedBox(height: 20,),
                                 Text(
                                   'DO YOU KNOW?',textAlign: TextAlign.left,style: TextStyle(
                                     fontSize:20,
                                     fontFamily: 'ubuntu',
                                     fontWeight: FontWeight.bold

                                   ),),
                                   SizedBox(height: 20,),
                                   Text(
                                  checkpoints[index].fact,textAlign: TextAlign.left,style: TextStyle(
                                     fontSize:20,
                                     fontFamily: 'ubuntu',

                                   ),),



                                 
                ]),
                              ),
                              
                                          //    GestureDetector(
                                          //    onTap: (){
                                          //       // BlocProvider.of<Cubits>(context).goHome();
                                          //      Navigator.push(context, MaterialPageRoute(builder: ((context) => const Nav(index: 1))));
                                          //    },
                                          //    child: Container(
                                          //        width: 100,
                                          //        child: Row(
                                          //          children: [
                                          //            ResponsiveButton(text:'Ready',width: 100,),
                                          //          ],
                                          //        )),
                                          //  ),
                            ],
                          ),
                        )
                        ),
   ),
 ),
                    




        GestureDetector(
              onTap: () async {
                // BlocProvider.of<Cubits>(context).goHome();
                //BlocProvider.of<Cubits>(context).game(detail.tour);
              // var newi = newindex++;
              //incrementindex();
              print(index);
              print('points: ' + newpoints.toString());
                Navigator.push(context, MaterialPageRoute(builder: ((context) => locationpage(index: index+1, checkpoints: checkpoints,length: length,question: question,points: newpoints))));
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
                     
                      ResponsiveButton(
                        
                        text:text,width: 100,),
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