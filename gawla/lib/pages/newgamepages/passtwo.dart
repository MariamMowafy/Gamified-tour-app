import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/newgamepages/newnav.dart';
import 'package:gawla/pages/newgamepages/newquestion.dart';

import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/responsive_button.dart';
class pass extends StatefulWidget {
  const pass({Key? key,}) : super(key: key);

  @override


  State<pass> createState() => _passState();
}

class _passState extends State<pass> {

   
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
      DetailState detail2 = state as DetailState;
       Future.delayed(Duration.zero,(){
        Navigator.push(context, MaterialPageRoute(builder: ((context) =>HomePage())));
  }); 
   
    
  return SizedBox();
   });
  }
}