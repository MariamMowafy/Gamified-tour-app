import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

import 'place_item.dart';

class PlaceStaggeredGridview extends StatelessWidget {
  const PlaceStaggeredGridview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(
      builder: (context, state){
        if(state is LoadedState){
      List<TourModel> tourInfo = state.tours;
      var tourCreatorInfo = state.tourCreators;

      return Container(
        padding: EdgeInsets.all(24),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: tourInfo.length,
          itemBuilder: (context, index) => PlaceItem(index),
        )
          //crossAxisSpacing: 16,

          //itemBuilder: (context, index) => PlaceItem(index),

      );
    }else{
          return Container();

        }
      },
    );
  }
}