import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_states.dart';
import '../../cubit/cubits.dart';
import '../../widgets/app_large_text.dart';
import '../../widgets/responsive_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class redeemreward extends StatefulWidget {
  redeemreward({Key? key}) : super(key: key);

  @override
  State<redeemreward> createState() => _redeemrewardState();
}

class _redeemrewardState extends State<redeemreward> {
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      redeemrewardState detail = state as redeemrewardState;
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
                        SizedBox(height: 50,),
                          Container(
                            //alignment: Alignment.center,
                            child: QrImage(
                                   data: detail.toString(),
                                   version: QrVersions.auto,
                                   size: 300.0,
                          )),
                            //Image(image: AssetImage('assets/img/barcode.png'))),
                           
                          
                           SizedBox(height:80),
                          Padding(
                          padding: const EdgeInsets.only(left:8.0,right: 8),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Voucher only applies on selected items' ,style:TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'ubuntu'),textAlign: TextAlign.center,)),
                        ),
                        SizedBox(height:50),
                        GestureDetector(
                                     onTap: (){
                                       BlocProvider.of<Cubits>(context).goHome
                                       ();//holds the cubit and can access them
                                     },
                                     child: Container(
                                         width: 100,
                                         child: Row(
                                           children: [
                                             ResponsiveButton(text:'Done',width: 100,),
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