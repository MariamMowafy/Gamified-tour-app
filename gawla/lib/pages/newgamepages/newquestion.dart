import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:gawla/pages/newgamepages/newnav.dart';

import '../../widgets/responsive_button.dart';

class newquest extends StatelessWidget {
  final index;
  final checkpoints;
  final length;
  final question;
  const newquest({Key? key, required this.index, required this.checkpoints, required this.length, required this.question}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return  GestureDetector(
                                       onTap: () async {
                                          // BlocProvider.of<Cubits>(context).goHome();
                                         //BlocProvider.of<Cubits>(context).game(detail.tour);
                                       // var newi = newindex++;
                                        //incrementindex();
                                        print(index);
                                         Navigator.push(context, MaterialPageRoute(builder: ((context) => locationpage(index: index+1, checkpoints: checkpoints,length: length,question: question,))));
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
                                     );
  
  }
}