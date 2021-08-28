import 'package:flutter/material.dart';

class ChooseTableScreen extends StatelessWidget {
  const ChooseTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Choose Table Screen")),
      body: Container(color: Colors.lightGreen,),
    );
  }
}
