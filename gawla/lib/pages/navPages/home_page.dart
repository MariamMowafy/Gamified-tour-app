import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/navPages/contact_page.dart';
import 'package:gawla/pages/navPages/edit_profile_page.dart';
import 'package:gawla/pages/navPages/profile_page.dart';
import 'package:gawla/pages/navPages/reward_details.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';

import '../../widgets/responsive_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
  @override
  Widget build(BuildContext context) {
    //****** Controller declaration ******//
    TabController _tabController = TabController(length: 2, vsync: this);
    //Controller usage: so that every time i click a button, it gets rebuild
    //so i need to refer to a context which is represented by "vsync"
    return Scaffold(
      body: BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            List<TourModel> tourInfo = state.tours;
             var tourCreatorInfo = state.tourCreators;

            return SingleChildScrollView(
              child: Stack(
                children:[ Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //*************The Header***********//
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Row(
                        children: [
                          /*Icon(
                      Icons.menu_rounded,
                      size: 30,
                      color: Colors.black54,
                    ),*/
                          Expanded(child: Container()),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            //to put a margin between the image and the right
                            width: 20,
                            height: 20,
              
                            decoration: BoxDecoration(
                              //since we are going to border the box
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //**********"Tours" text********//
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppLargeText(text: "Scavenger Hunt"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppText(text: "Where tours are more fun!"),
                    ),
                    //****"MyTours,All Tours" row*****//
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Align(
                        //wrapping TabBar with this widget to align all the left texts on one coloumn
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelPadding: const EdgeInsets.only(left: 30, right: 30),
                          //to control spaces between texts
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,//to align all the left texts on one coloumn
                          indicatorSize: TabBarIndicatorSize.label,
                          //so the indicator dot beneath teb2a 3al 2ad
                          indicator:
                          CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                          //need to be positioned below labels still..
                          tabs: [
                            Tab(
                              text: "Available hunts",
                            ),
                            Tab(
                              text: "My Rewards",
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    //***********My tours Tiles**********//
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      //a margin only at the left
                      height: 300,
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                            itemCount: 4,//to be adjusted dynamically******
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  print(tourCreatorInfo.length);
                                  print(tourInfo.length);
              
                                  BlocProvider.of<Cubits>(context).detailPage(tourInfo[index]);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 20, top: 15),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(tourInfo[index].img),
                                          //image: NetworkImage("https://dummyimage.com/216x116.png/ff4444/ffffff"),
                                          fit: BoxFit.cover
              
                                      )
                                  ),
                                ),
                              );
                            },
                          ),
                         // Text("Hi"),
                         ListView.builder(
                            itemCount: 4,//to be adjusted dynamically******
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: (){
                                  print(tourCreatorInfo.length);
                                  print(tourInfo.length);
                                  
                                 BlocProvider.of<Cubits>(context).rewarddetails();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 20, top: 15),
                                      width: 200,
                                      height: 285,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.black,
                                          image: DecorationImage(
                                              image: AssetImage('assets/img/reward.png'),
                                              //image: NetworkImage("https://dummyimage.com/216x116.png/ff4444/ffffff"),
                                              fit: BoxFit.cover
              
                                          )
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              );
                            },
                          ),
                          //Running without a Tab bar-controller would give an error, therefore :
                          //"TickerProviderStateMixin" class needed to be extended to use their own pre-defined states
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //**********Advertisement**********//
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                   onTap: (){
                                     BlocProvider.of<Cubits>(context).choosetour(tourInfo[0]);//holds the cubit and can access them
                                   },
                                   child: AppText(text: "See all available hunts", color: AppColors.textColor1),)
                              //AppLargeText(text: "Explore more", size: 20),
                              // AppText(text: "See all available hunts", color: AppColors.textColor1)
                            ],
                          ),
                        ),
                        // SizedBox(width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,),
                        // Container(
                        //   margin: const EdgeInsets.only(left: 20, right: 22),
                        //   child: Row(
                            
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                              
                        //       //AppLargeText(text: "Explore more", size: 20),
                        //       AppText(text: "See all rewards", color: AppColors.textColor1)
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children:[ Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                                 width: 250,
                                 //itemBuilder:(BuildContext context, int index),
                                   child: GestureDetector(
                                     onTap: (){
                                       BlocProvider.of<Cubits>(context).choosetour(tourInfo[0]);//holds the cubit and can access them
                                     },
                                     child: Container(
                                         width: 150,
                                         child: Row(
                                           children: [
                                             ResponsiveButton(text:'Play',width: 130,),
                                           ],
                                         )),
                                   ),
                                 alignment: Alignment.bottomLeft,
                    
                    
                               ),
                      ),
                             
                //  Expanded(
                //    flex: 1,
                //    child: Image.asset(
                //                'assets/img/treasure-hunt-logo.jpeg', height: 10, width: 10,
                //              ),
                //  ),
                       ] )
                     
                    // Container(
                    //   height: 100,
                    //   width: double.maxFinite,
                    //   margin: const EdgeInsets.only(left: 20),//howa elli 3amel el border elli 3al shmal
                    //   child: ListView.builder(
                    //       itemCount: 4,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (_, index) {
                    //         return Column(
                    //           children: [
                    //             Container(
                    //               margin: const EdgeInsets.only(right: 30),
                    //               width: 200,
                    //               height: 80,
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(20),
                    //                   color: Colors.white,
                    //                   image: DecorationImage(
                    //                       image: AssetImage("assets/img/mountain.jpeg"),
                    //                       fit: BoxFit.cover)),
                    //             )
                    //           ],
                    //         );
                    //       }),
                    // ),
              
                  ],
                ),
                //SizedBox(height: 100,),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Image(image: AssetImage('assets/img/treasure-hunt-logo.jpeg'),))
                // Container(
                //                  // margin: const EdgeInsets.only(top: 200,left:120),
                //                   width: 200,
                //                   height: 300,
                //                   alignment: Alignment.bottomRight,
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(20),
                //                      // color: Colors.black,
                //                       image: DecorationImage(
                //                           image: AssetImage('assets/img/treasure-hunt-logo.jpeg'),
                //                           //image: NetworkImage("https://dummyimage.com/216x116.png/ff4444/ffffff"),
                //                           fit: BoxFit.cover
              
                //                       )
                //                   ),
                //                 ),
                ]),
            );
          }else{
            return Container();
          }
        },
      ),
    //     bottomNavigationBar: BottomNavigationBar(
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
}

//To design/paint the "dot effect" that appears below selected labels
class CircleTabIndicator extends Decoration {
  //to design the indicator it is done externally
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
    //throw UnimplementedError();
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint

    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
