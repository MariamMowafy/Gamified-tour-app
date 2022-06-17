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
import 'package:gawla/widgets/profile_widgets/rewardsgrid.dart';

import '../../widgets/responsive_button.dart';
import '../../widgets/exploregrids.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
//import 'package:gawla/widgets/appbar.dart';
//import 'package:gawla/widgets/exploregrids.dart';


class choosereward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(builder: (context,state){
     // chooserewardState detail = state as chooserewardState;
    return Scaffold(
      //appBar: header(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            
            Padding(
              padding: EdgeInsets.only(top:20),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    IconButton(onPressed: () {
                          //BlocProvider.of<Cubits>(context).goHome();
                        }, icon: Icon(Icons.arrow_back),
                          color: Colors.black,
                        ),
                    SizedBox(width: 3),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 5.0),
                    //   child: Icon(
                    //     Icons.arrow_drop_down,
                    //     size: 15,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Flexible(
              child: rewardgrid(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              
            ),
          ],
        ),
      ),
    );});
  }
}