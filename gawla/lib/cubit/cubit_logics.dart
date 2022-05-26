import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/navPages/how_to_play.dart';
import 'package:gawla/pages/navPages/redeem_reward.dart';
import 'package:gawla/pages/navPages/reward_details.dart';
import 'package:gawla/pages/tour_page.dart';
import 'package:gawla/pages/welcome_page.dart';
import '../pages/navPages/game.dart';
import '../pages/navPages/choose_tour.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Cubits,CubitStates>(//check on states and emit them
        builder: (context, state){//to check on states
          if(state is WelcomeState){
            return welcomePage();
          }
          if(state is DetailState){
            return TourPage();
          }
          if(state is LoadedState){
            return HomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{ 
            if(state is choosetourState){
            return choosetour();
          }else{
            if(state is rewarddetailsState){
            return rewarddetails();
          }else{
            if(state is howtoplayState){
            return howtoplay();
            }else{
            if(state is redeemrewardState){
            return redeemreward();
          }
          else{
            if(state is gameState){
            return game();
          }else{
            print("not the required state");
            return Container();
          }}
          }
        }}
        }}
      ),

      );
  }
}
