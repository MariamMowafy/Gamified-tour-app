import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/pages/game_pages/nav.dart';
import 'package:gawla/pages/game_pages/navigation_page.dart';

import '../../cubit/cubits.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/responsive_button.dart';
class howtoplay extends StatefulWidget {
  howtoplay({Key? key}) : super(key: key);

  @override
  State<howtoplay> createState() => _howtoplayState();
}

class _howtoplayState extends State<howtoplay> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      howtoplayState detail = state as howtoplayState;
      //newnavState test = state as newnavState;
    return Scaffold(
     body: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
                    Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(onPressed: () {
                          BlocProvider.of<Cubits>(context).goHome()
                          ;
                        }, icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                    ),
                    SizedBox(height: 30),
                    AppLargeText(text: 'How to play'),
                    SizedBox(height: 40,),
                   Container(

                     height: 500,
                     width: 300,
                     decoration: BoxDecoration(
                      // border: Border.all(color: Colors.deepPurpleAccent),
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.all(
                            Radius.circular(30),
                            
                        ),
                       
                     ),
                     //margin:EdgeInsets.only(top: 150) ,
                    child:Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              SizedBox(height: 50,),
                           Text(
                             '1. Search for the monument.',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),
                             SizedBox(height: 30,),
                             Text(
                             '2. Pin your current location on the map.',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),
                             SizedBox(height: 30,),
                             Text(
                             '3. Check if your location is correct.',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),
                             SizedBox(height: 30,),
                             Text(
                             '4. Do the stated task to get the next clue.',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),
                             SizedBox(height: 30,),
                             Text(
                             '5. Repeat until you reach the final clue to get your reward.',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),

                             SizedBox(height: 30,),
                             Text(
                             '6. Finally, don\'t forget to have fun and enjoy!',textAlign: TextAlign.left,style: TextStyle(
                               fontSize:20,
                               fontFamily: 'ubuntu',

                             ),),
                             SizedBox(height: 30,),
                             




                           
            ]),
                        ),
                        GestureDetector(
                                       onTap: (){
                                          // BlocProvider.of<Cubits>(context).goHome();
                                         //BlocProvider.of<Cubits>(context).game(detail.tour);

                                         BlocProvider.of<Cubits>(context).newnave(index: 0);
                                       },
                                       child: Container(
                                           width: 100,
                                           child: Row(
                                             children: [
                                               ResponsiveButton(text:'Ready',width: 100,),
                                             ],
                                           )),
                                     ),
                                       GestureDetector(
                                       onTap: (){
                                          // BlocProvider.of<Cubits>(context).goHome();
                                         Navigator.push(context, MaterialPageRoute(builder: ((context) => const Nav(index: 1))));
                                       },
                                       child: Container(
                                           width: 100,
                                           child: Row(
                                             children: [
                                               ResponsiveButton(text:'Ready',width: 100,),
                                             ],
                                           )),
                                     ),
                      ],
                    )
                    ),
                    
                    ],
                  )
                  ),
      
    );
  }) ; }
}