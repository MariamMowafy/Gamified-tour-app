import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class done extends StatelessWidget {
  const done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:80.0),
        child: Text('Congratulations, reward kaza, go to rewars page, and home button'),
      ),
    );
  }
}