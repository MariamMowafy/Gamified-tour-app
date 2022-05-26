
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';
import 'package:gawla/widgets/responsive_button.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  List images = ["onboarding1.png","onboarding2.png","onboarding3.png"];
  List descriptions = ["Homepage with all available tours to join!","Start playing by solving questions and getting more clues!","Finish the game and get your reward!"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,                            //3 scollable pages
          itemBuilder: (_,index){                  //(default context, index as it will run 3 times)
             return Container(
               width: double.maxFinite,
               height: double.maxFinite,


               child: Container(
                 width: double.maxFinite,
               height: double.maxFinite,
                 margin: const EdgeInsets.only(top: 100,left: 20, right: 20),
                 child: Row(
                   
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         AppLargeText(text: "Scavenger Hunt"),
                         //AppText(text: "Egypt",size:30),
                         SizedBox(height: 20,),
                         Container(
                           width: 250,
                           child: AppText(
                             text:"Spice your trip with tours like no other.",
                             color: AppColors.textColor2,
                             size: 14,
                           )
                         ),
                         SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.only(top:65),
                           child: Padding(
                             padding: const EdgeInsets.all(20),
                             child: Image(image: AssetImage("assets/img/"+images[index]),
                                 width: 300,
                                 height: 300,
                                 alignment: Alignment.center,
                               ),
                           ),
                         ),
                          Padding(
                           padding: const EdgeInsets.only(top:5),
                           child: Container(
                            // alignment: Alignment.bottomCenter,
                             width: 330,
                             child: Padding(
                               padding: const EdgeInsets.all(20),
                               child: Text(descriptions[index],
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                
                                 color: Colors.grey,
                                 fontFamily: 'ubuntu',
                                 fontSize: 20
                               ),
                                 ),
                             ),
                           ),
                         ),
                         SizedBox(height: 40,),
                         Padding(
                           padding: const EdgeInsets.only(left: 20),
                           child:
                             Container(
                               
                               width: 300,
                                 child: GestureDetector(
                                   onTap: (){
                                     BlocProvider.of<Cubits>(context).getData();//holds the cubit and can access them
                                   },
                                   child: Container(
                                       width: 150,
                                       child: Row(
                                         children: [
                                           ResponsiveButton(text:'Let\'s go!',width: 150,),
                                         ],
                                       )),
                                 ),
                               alignment: Alignment.bottomCenter,


                             ),
                           
                         )

                       ],
                     ),
                     Column(
                       
                       children: List.generate(3, (indexDots){
                         return Container(
                           
                           margin: const EdgeInsets.only(bottom: 3),//to leave spaces in between the dots
                           width: 8,
                           height: index==indexDots?25:8,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: index==indexDots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                           ),
                         );
                       }),
                     ),
                   ],
                 )
               ),

             );
      }),
    );
  }
}