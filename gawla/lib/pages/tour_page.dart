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

import '../widgets/responsive_button.dart';
import 'navPages/contact_page.dart';
import 'navPages/edit_profile_page.dart';
import 'navPages/profile_page.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  List pages = [
    HomePage(),
    ProfilePage(),
    ContactPage(),
    SettingsPage()
  ];
  int currentIndex = 0;
  void onTap(int index){ // on tapping any of the 4 below icons an index passed to this function
    setState(() { //the index get saved here
      currentIndex = index; // in the name of this variable
    });
  }
  int gottenStars=3;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              //Image is placed first
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(detail.tour.img),
                          fit: BoxFit.cover
                      ),
                    ),
                  )
              ),
              //then the back icon is put to not be covered beneath
              Positioned(
                  left: 10,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        BlocProvider.of<Cubits>(context).goHome();
                      }, icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),

                    ],
                  )),
              Positioned(
                  top: 250,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,//To align all below rows to start from left
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                          children: [
                            AppLargeText(text: detail.tour.name,color: Colors.black),
                           // AppLargeText(text: "\$"+detail.tour.price.toString(),color: AppColors.mainColor)

                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_pin,color: AppColors.mainColor,),
                            SizedBox(width: 5,),
                            AppText(text: detail.tour.location,color: AppColors.textColor1,)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index){
                                  return Icon(Icons.star,color: index<gottenStars?AppColors.starColor:AppColors.textColor2);
                                })
                            ),
                            SizedBox(width: 10,),
                            AppText(text: "(4.0)",color: AppColors.textColor2,)
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            AppLargeText(text: "Checkpoints",color: Colors.black.withOpacity(0.8),size: 20,),
                            SizedBox(width:25),
                            AppText(text: "5")
                          ],
                        ),
                        SizedBox(height: 15,),
                        // Wrap(
                        //   children: List.generate((5), (index){
                        //     return InkWell(
                        //       onTap: (){
                        //         setState(() {
                        //           selectedIndex=index;
                        //         });
                        //       },
                        //       child: Container(
                        //         margin: const EdgeInsets.only(right: 10),
                        //         child: AppButton(size: 50,
                        //             color: selectedIndex==index?Colors.white: Colors.black,
                        //             backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                        //             borderColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                        //             //isIcon:false,//to not have to customize it using the below line of code
                        //             //icon: Icons.favorite_border,
                        //             text: (index+1).toString()
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        // ),
                        SizedBox(height: 15,),
                        AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                        SizedBox(height: 15,),
                        AppText(text: detail.tour.description,color:AppColors.mainTextColor),
                        SizedBox(height:40),
                        //  Container( alignment: Alignment.center,
                        //                  width: 100,
                        //                  child: Row(
                        //                    children: [
                        //                     ResponsiveButton(width: 100,),
                        //                    ],
                        //                  )),
Container(
                                 ///width: 250,
                                 //itemBuilder:(BuildContext context, int index),
                                   child: GestureDetector(
                                     onTap: (){
                                       BlocProvider.of<Cubits>(context).howtoplay(detail.tour);//holds the cubit and can access them
                                     },
                                     child: Container(
                                         width: 100,
                                         child: Row(
                                           children: [
                                             ResponsiveButton(text:'Play',width: 100,),
                                           ],
                                         )),
                                   ),
                                 alignment: Alignment.center,
                    
                    
                               ),

                      ],
                    ),
                  ))
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     unselectedFontSize: 0,//to avoid the error of tapping the text
        //     selectedFontSize: 0,//to avoid the error of tapping the text
        //     backgroundColor: Colors.white,
        //     type: BottomNavigationBarType.fixed,
        //     onTap: onTap,
        //     currentIndex: currentIndex,
        //     selectedItemColor: Colors.black54,
        //     unselectedItemColor: Colors.grey.withOpacity(0.5),
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     elevation: 0, // to get rid of the upper line border of the bar
        //     items:[
        //       BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home)),
        //       BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.account_circle_outlined)),
        //       BottomNavigationBarItem(label:"Contact",icon: Icon(Icons.chat_outlined)),
        //       BottomNavigationBarItem(label:"Settings",icon: Icon(Icons.settings)),

        //     ]
        // ),

      );
    }
    );
  
  }
}
