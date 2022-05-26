import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';


class PlaceItem extends StatelessWidget {
  final int index;

  const PlaceItem(this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState) {
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;
        return GestureDetector(
          onTap: () {
            BlocProvider.of<Cubits>(context).detailPage(tourInfo[index]);
          },
          child: Container(
            alignment: Alignment.bottomLeft,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(tourInfo[index].img),
                  //image: NetworkImage("https://dummyimage.com/216x116.png/ff4444/ffffff"),
                  fit: BoxFit.cover

              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tourInfo[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tourInfo[index].category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }else{
        return Container();

      }
      }


    );
  }
}