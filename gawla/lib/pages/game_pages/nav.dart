import 'package:flutter/material.dart';
import 'package:gawla/models/checkpoint_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/game_pages/navigation_page.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/providers/checkpoints_provider.dart';
import 'package:gawla/widgets/checkpoint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../widgets/responsive_button.dart';

class Nav extends StatelessWidget {
  final index;
  const Nav({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            else if(index==2) {
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
                  child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(30,20)),  )
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
                                             Navigator.push(context, MaterialPageRoute(builder: ((context) => quest(question: question))));
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
     return const Center(
                child: CircularProgressIndicator(),
              );
   }
   
   
   
             //   return Nav();
              // }
              // else return const Center(
              //   child: CircularProgressIndicator(),
                  // );
            
  });

}

}
