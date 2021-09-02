import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Routes {
  static Route<DateTime?> datePickerRoute(BuildContext context,
      Object? arguments,) {
    return DialogRoute<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return DatePickerDialog(
            initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
            firstDate: DateTime(2002, 1, 2),
            lastDate: DateTime.now(),);
        }
    );
  }

  static Route<String?> tableTypeRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Select table type"),
            titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            children: <Widget>[
              SimpleDialogOption(
                padding: EdgeInsets.all(8),
                onPressed: () {Navigator.pop(context, "A"); },
                child: const Text("Table A"),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(8),
                onPressed: () {Navigator.pop(context, "B"); },
                child: const Text("Table B"),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(8),
                onPressed: () {Navigator.pop(context, "C"); },
                child: const Text("Table C"),
              ),
            ],
          );
        }
    );
  }

  static Route aboutDialogRoute(
      BuildContext context,
      ) {
    return DialogRoute(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("About"),
            titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          );
        }
    );
  }
}