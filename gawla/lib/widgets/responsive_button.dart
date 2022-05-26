import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawla/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width; 
  String text;    //? : means optional to pass it a value or not

  ResponsiveButton({Key? key,required this.text,this.width,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: 
          //Image.asset("assets/img/button-one.png")
          Container(
            alignment: Alignment.center,
            child: Text(text,style: TextStyle(color: Colors.white, fontFamily: 'ubuntu',fontSize: 20),))
       
    );
  }
}
