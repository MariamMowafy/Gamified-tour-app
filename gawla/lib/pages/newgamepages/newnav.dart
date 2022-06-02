import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/newgamepages/newquestion.dart';

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
        //print( newindex);
    return Scaffold(
      body: Column(
        children: [
          Text(checkpoints[index].name),
          Text(question.toString()),
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
    return Text("data");
  }
}

// class newnave extends StatefulWidget {
//   const newnave({Key? key, this.index}) : super(key: key);

//   @override
// final index;

//   State<newnave> createState() => _newnaveState();
// }

// class _newnaveState extends State<newnave> {
 
//     var newindex;  
//   @override
  
// void setnewindex(){
//         newindex=widget.index+1;
//        print(newindex);
//       }  
      
//       // void incrementindex(){
//       //   newindex++;
//       //  // print(newindex);
//       // }
//   Widget build(BuildContext context) {
     
      
//     return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
//       newnavState detail = state as newnavState;
      //print('ba3d setindex el gowa');
     // setnewindex();
    //  newindex=widget.index;
//       while(widget.index<detail.checkpoint.length+1){
//         print('inside loop');
//         //print( newindex);
//     return Scaffold(
//       body: Column(
//         children: [
//           Text(detail.checkpoint[widget.index].name),
//           GestureDetector(
//                                        onTap: () async {
//                                           // BlocProvider.of<Cubits>(context).goHome();
//                                          //BlocProvider.of<Cubits>(context).game(detail.tour);
//                                        // var newi = newindex++;
//                                         //incrementindex();
//                                         print(widget.index);
//                                          Navigator.push(context, MaterialPageRoute(builder: ((context) => newquest(index: widget.index))));
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
//                                      ),

//         ],
//       )
//     );}
 //   return SizedBox();});
//   }
// }