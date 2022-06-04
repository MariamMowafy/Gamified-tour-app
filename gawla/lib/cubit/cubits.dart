import 'package:bloc/bloc.dart';
import 'package:gawla/models/checkpoint_model.dart';

import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/questions_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/game_pages/question_page.dart';
import 'package:gawla/pages/navPages/redeem_reward.dart';
import 'package:gawla/pages/navPages/reward_details.dart';
import 'package:gawla/services/data_services.dart';
import 'package:gawla/widgets/checkpoint.dart';

import 'cubit_states.dart';

class Cubits extends Cubit<CubitStates> {
  //what's written between "<>" is what will be listened to by the cubit
  Cubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState()); //once initail state is done, emit new state
  } //Cubits parameters declaration are those of the InitialState()

  final DataServices data;
  late final tourCreators;
  late final tours;

  void getData()async {
    try {
      emit(LoadingState());//show loading state
      tourCreators = await data.getTourguideInfo();//during this try to load data
      tours = await data.getTourInfo();
      emit(LoadedState(tourCreators,tours));//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }
  choosetour(TourModel tour){
    emit(choosetourState(tours));
  }
  // detailPage(DataModel tourCreators,TourModel tour){
  //   emit(DetailState(tourCreators, tour));
  // }
  detailPage(TourModel tour){
    emit(DetailState(tour));
  }
   rewarddetails(){
     print('cubits');
    emit(rewarddetailsState());
  }
    redeemreward(){
     print('cubits');
    emit(redeemrewardState());
  }
  goHome(){
    emit(LoadedState(tourCreators, tours));
  }
    game(TourModel tour){
    emit(gameState(tour));
  }
   howtoplay(TourModel tour){
    emit(howtoplayState(tour));
  }
     newnave() async {
      try {
      emit(LoadingState());//show loading state
      final List<CheckpointModel> checkpoint = await data.getcheckpoints() as List<CheckpointModel>;//during this try to load data
      final List<QuestionsModel> question = await data.getcheckpointsquestion()  as List<QuestionsModel>;
      emit(newnavState(checkpoint,question));//once data loaded, trigger the loaded state with the new updated data
    } catch (e) {}
  }



  }
  //    navigation(QuestionsModel question, CheckpointModel checkpoint){
  //   emit(navigation);
  // }
