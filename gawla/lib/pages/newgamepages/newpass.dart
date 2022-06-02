import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/pages/newgamepages/newnav.dart';
import 'package:gawla/pages/newgamepages/newquestion.dart';

import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/responsive_button.dart';
class newnave extends StatefulWidget {
  const newnave({Key? key, this.index}) : super(key: key);

  @override
final index;

  State<newnave> createState() => _newnaveState();
}

class _newnaveState extends State<newnave> {
 
   
  @override
 
      
      // void incrementindex(){
      //   newindex++;
      //  // print(newindex);
      // }
  Widget build(BuildContext context) {
     
      Future.delayed(Duration.zero,(){
       //your code goes here
  }); 
    return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      newnavState detail = state as newnavState;

       Future.delayed(Duration.zero,(){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => locationpage(index: widget.index,length:detail.checkpoint.length,checkpoints:detail.checkpoint,question:detail.question))));
  }); 
   
    
  return SizedBox();
   });
  }
}