// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_logics.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/create_tour_page.dart';
import 'package:gawla/pages/main_page.dart';
import 'package:gawla/pages/tour_page.dart';
import 'package:gawla/pages/welcome_page.dart';
import 'package:gawla/services/data_services.dart';
import 'package:provider/provider.dart';
import 'package:gawla/providers/checkpoints_provider.dart';
//first line is to guarantee "no-sound-null-safety"



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    
    MultiProvider(
      providers:  [
        ChangeNotifierProvider(
          create: (_) => checkpoints_provider(),
        ),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white
        ),
        //supportedLocales: i18n.all,
    
        home: 
        //wrap f provider
        BlocProvider<Cubits>(//BlockProvider: injects cubits
          create: (context)=>Cubits(
            data: DataServices(),
          ),//pass the class of function,create the cubit
          child: CubitLogics(),//then show the logic
          //pass the child that checks the cubits/states
        ),
      ),
    );
  }
}
