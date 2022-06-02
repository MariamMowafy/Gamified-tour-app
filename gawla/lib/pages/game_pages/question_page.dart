import 'package:flutter/material.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/pages/game_pages/fact_page.dart';
import 'package:gawla/widgets/responsive_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/checkpoints_provider.dart';
class quest extends StatelessWidget {
  final QuestionsModel question;
  final index;
  const quest({
    Key? key,
    required this.question, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text('correct!'),
                  SizedBox(height:10),
                  Text(question.fact),
                  SizedBox(height:10),
                  Text(question.fact),
                  SizedBox(height:10),
                  Text('a) answer1 b) answer2 c) answer3'),
                  SizedBox(height:10),
                  Text('points: '),
                  GestureDetector(
                                       onTap: (){
                                          // BlocProvider.of<Cubits>(context).goHome();
                                        Navigator.push(context, MaterialPageRoute(builder: ((context) => fact(index: index))));
                                        //pass checkpoints
                                       },
                                       child: Container(
                                           width: 100,
                                           alignment: Alignment.center,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               ResponsiveButton(text:'fact',width: 100,),
                                             ],
                                           )),
                                     ),
                ],
              ),
            )
        ]
    ),
      ));
  }
}
