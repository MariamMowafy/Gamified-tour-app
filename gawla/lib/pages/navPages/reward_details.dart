import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/widgets/app_button.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';

import '../../widgets/responsive_button.dart';
import '../navPages/contact_page.dart';
import '../navPages/edit_profile_page.dart';
import '../navPages/profile_page.dart';

class rewarddetails extends StatefulWidget {
  const rewarddetails({Key? key}) : super(key: key);

  @override
  _rewarddetailsState createState() => _rewarddetailsState();
}

class _rewarddetailsState extends State<rewarddetails> {
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      rewarddetailsState detail = state as rewarddetailsState;
      return 
      Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
                    Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(onPressed: () {
                          BlocProvider.of<Cubits>(context).goHome();
                        }, icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                    ),
                    SizedBox(height: 30),
                   Container(
                     height: 600,
                     width: 300,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.deepPurpleAccent),
                       color: Colors.white,
                       borderRadius: BorderRadius.all(
                            Radius.circular(30),
                            
                        ),
                       
                     ),
                     //margin:EdgeInsets.only(top: 150) ,
                     child:  Column(

                       children: [
                         //Padding(padding: EdgeInsets.only(top:150,bottom: 50,right: 50,left:50)),
                        // SizedBox(height: 200,),
                        SizedBox(height: 30,),
                        Container(
                          alignment: Alignment.center,
                          child: AppLargeText(text:'  Voucher 30% OFF  ')),
                          SizedBox(height: 20,),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_pin,color: Colors.deepPurpleAccent,),
                                SizedBox(width: 3,),
                                Text('The Great Pyramids', style: 
                                TextStyle(
                                  
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 18,
                                  fontFamily: 'ubuntu'
                                ),
                                textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height:30),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Where to redeem' ,style:TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'ubuntu'),)),
                        ),
                        SizedBox(height:13),
                         Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Redeem this voucher at the gift shop available infront of the main gate!' ,style:TextStyle(color: Colors.grey,fontSize: 20, fontFamily: 'ubuntu'),)),
                        ),
                        
                        SizedBox(height:30),
                         Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('How to redeem' ,style:TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'ubuntu'),)),
                        ),
                        
                         
                         SizedBox(height:20),
                          Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Show the retailer the QR code that appears when you click the Redeem button below.' ,style:TextStyle(color: Colors.grey, fontSize: 20, fontFamily: 'ubuntu'),)),
                        ),
                        
                          SizedBox(height:30),
                          
                          Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('terms and conditions' ,style:TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'ubuntu')),),
                        ),
                        
                           
                          
                           SizedBox(height:20),
                          Padding(
                          padding: const EdgeInsets.only(left:8.0,right: 8),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Voucher only applies on selected items' ,style:TextStyle(color: Colors.grey, fontSize: 20, fontFamily: 'ubuntu'),)),
                        ),
                        SizedBox(height:50),
                        GestureDetector(
                                     onTap: (){
                                       BlocProvider.of<Cubits>(context).redeemreward();//holds the cubit and can access them
                                     },
                                     child: Container(
                                         width: 100,
                                         child: Row(
                                           children: [
                                             ResponsiveButton(text:'Redeem',width: 100,),
                                           ],
                                         )),
                                   ),
                            
                       ],
                     ),
                   )
                    ],
                  )
                  ),
       
           
         
      );
     });
}
}

  
