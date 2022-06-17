import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import '../../widgets/responsive_button.dart';
class done extends StatelessWidget {
  final points;
  const done({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newpoints = points;
    return Scaffold(
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:35.0),
            child: Image(image:AssetImage('assets/img/rewarddone.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: 
            Column(
              children: [
                 Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Congratulations!',style: TextStyle(fontSize: 30,fontFamily: 'ubuntu',fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Points: '+newpoints.toString(),style: TextStyle(fontSize: 30,fontFamily: 'ubuntu',fontWeight: FontWeight.bold)),
          ),
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('You have won.',style: TextStyle(fontSize: 23,fontFamily: 'ubuntu',fontWeight: FontWeight.bold)),
          ),
           Container(
            alignment: Alignment.center,
             child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text('We are so proud of you for completing the hunt! Go to rewards page to redeem your reward.',style: TextStyle(fontSize: 20,fontFamily: 'ubuntu',fontWeight: FontWeight.bold,color: Color.fromARGB(255, 106, 106, 106)),textAlign: TextAlign.center,),
          ),
           ),
          
               // Text('Congratulations, reward kaza, go to rewars page, and home button'),
              ],
            ),
          ),
              GestureDetector(
                    onTap: (){
                      // BlocProvider.of<Cubits>(context).goHome();
                     Restart.restartApp();
                    },
                    child: Container(
                        width: 100,
                        child: Row(
                          children: [
                            ResponsiveButton(text:'Home',width: 100,),
                          ],
                        )),
                  ),
        ],
      ),
    );
  }
}