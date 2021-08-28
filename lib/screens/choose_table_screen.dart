import 'package:flutter/material.dart';

class ChooseTableScreen extends StatelessWidget {
  const ChooseTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Choose Table Screen")),
      body: Container(
        color: Colors.lightGreen,
        child: DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime(2021,8,28),
          firstDate: DateTime(2021, 1, 1),
          lastDate: DateTime(2022, 1, 1),
        )
      ),
    );
  }
}

class SelectDate extends StatefulWidget {
  const SelectDate({Key? key, /*this.restorationId*/}) : super(key: key);

  //final String? restorationId;

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  //@override
  //String? get restorationId => widget.restorationId;

  final DateTime _selectedDate = DateTime(2021, 8, 28);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
