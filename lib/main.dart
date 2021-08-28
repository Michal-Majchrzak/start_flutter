import 'package:flutter/material.dart';
import 'package:start_flutter/routes.dart';
import 'package:start_flutter/display_table_screen.dart';
import 'package:start_flutter/choose_table_screen.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: Routes.home,
    routes: {
      Routes.home: (context) => DisplayTableScreen(),
      Routes.settings: (context) => ChooseTableScreen(),
    },
  ));
}
