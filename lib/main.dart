import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("App Bar Widget"),
      centerTitle: true,
    ),
    body: Center(
      child: Text("Text Widget inside Center Widget"),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Text("Button"),
    ),
  ),
));