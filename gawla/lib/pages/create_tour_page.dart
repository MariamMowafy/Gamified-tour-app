import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';
import 'package:gawla/widgets/checkpoint.dart';

class CreateTourPage extends StatefulWidget {
  const CreateTourPage({Key? key}) : super(key: key);

  @override
  _CreateTourPageState createState() => _CreateTourPageState();
}

class _CreateTourPageState extends State<CreateTourPage> {

  final items =['Marine','Safari','Religious','Medical','Cultural'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              //******* Back navigation arrow *********//
              Positioned(
                  left: 10,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                      ),

                    ],
                  )),
              //******* Rest of page *********//
              Positioned(
                  top: 100,
                  left: 24,
                  //width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,//To align all below rows to start from left
                    children: [
                      //************** Create new tour *************//
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                          children: [
                            AppLargeText(text: "Create new tour ",color: Colors.black),
                        ]
                      ),
                      SizedBox(height: 30,),
                      //************** Category *************//
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                          children: [
                            AppText(text: "Category",color: Colors.black),
                            Container(width: 120,),//Separator
                            Container(
                              //width: 60,
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.buttonBackground
                                //border: Border.all(color: Colors.deepPurpleAccent)
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: value,
                                  iconSize: 36,
                                  icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) =>setState(() =>
                                    this.value=value),
                                ),
                              ),
                            )//Drop down list
                          ]
                      ),
                      SizedBox(height: 30,),
                      //**************** Name *****************//
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                          children: [
                            AppText(text: "Name",color: Colors.black),
                            Container(width: 145,),
                            Container(
                              width: 130,
                              child: TextField(
                                //textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'Tour name',
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ]
                      ),SizedBox(height: 30,),
                      //************** Location *************//
                      Row(
                          children: [
                            AppText(text: "Location",color: Colors.black),
                            Container(width: 145,),
                            Container(
                              width: 110,
                              child: TextField(
                                //textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: 'City name',
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ]
                      ),SizedBox(height: 30,),
                      //************** Route checkpoints *************//
                      Row(
                          children: [
                            AppText(text: "Route",color: Colors.black),
                            Container(width: 150,),
                            Container(
                              width: 130,
                              height: 220,
                              child: Checkpoint(),
                            )
                          ]
                      ),
                      SizedBox(height: 20,),
                      //************** Max no. of people *************//
                      Row(
                          children: [
                            AppText(text: "Maximum number of people",color: Colors.black),
                            Container(width: 35,),
                            Container(
                              width: 70,
                              child: TextField(
                                //textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: '0',
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),

                          ]
                      ),SizedBox(height: 50,),
                      Row(
                          children: [
                            AppText(text: "Cover photo",color: Colors.black),
                            Container(width: 145,),
                            Container(
                              width: 80,
                              height: 80,
                              child: TextField(
                                //textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: '+',
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                                onChanged: (value) {
                                  // do something
                                },
                              ),
                            ),
                          ]
                      ),SizedBox(height: 50,),
                      Row(
                          children: [
                            AppText(text: "Description",color: Colors.black),
                            Container(width: 45,),
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1, color: Colors.purple, style: BorderStyle.solid)),
                              child: TextField(
                                minLines: 10,
                                maxLines: 20,
                                decoration: const InputDecoration(
                                    hintText: 'Type someting here',
                                    contentPadding: EdgeInsets.all(15),
                                    border: InputBorder.none),
                                onChanged: (value) {},
                              ),
                            ),

                          ]
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: MediaQuery.of(context).size.width-55,
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child:ElevatedButton(
                            child: Text("Submit"),
                            onPressed:() {

                            },
                          )
                      ),
                    ],

                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>DropdownMenuItem(
    value: item,
    child: Text(
      item,
  style: TextStyle(fontSize: 17)
    ),
  );

}
