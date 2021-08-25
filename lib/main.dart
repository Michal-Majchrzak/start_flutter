import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("App Bar Widget"),
      centerTitle: true,
      backgroundColor: Colors.deepPurpleAccent,
    ),
    body: Center(
      child: Text(
        "Text widget\ninside\nCenter widget",
        style: TextStyle(
          color: Colors.lightGreen[800],
          fontFamily: 'IndieFlower',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Text("Button"),
      backgroundColor: Colors.deepPurpleAccent,
    ),
  ),
));