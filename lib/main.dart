import 'package:flutter/material.dart';
import 'package:start_flutter/routes.dart';
import 'package:start_flutter/screens/display_table_screen.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    restorationScopeId: "exchangeRatesApp",
    initialRoute: Routes.home,
    routes: <String, WidgetBuilder> {
      Routes.home: (context) => DisplayTableScreen(restorationId: "main-screen",),
    },
  ));
}