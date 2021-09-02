import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:start_flutter/models/currency.dart';
import 'package:start_flutter/screens/dialogs.dart';

class DisplayTableScreen extends StatefulWidget {
  final String? restorationId;

  const DisplayTableScreen({
    Key? key,
    this.restorationId,
  }) : super(key: key);

  @override
  _DisplayTableScreenState createState() => _DisplayTableScreenState();
}

class _DisplayTableScreenState extends State<DisplayTableScreen>
  with RestorationMixin {
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
    RestorableDateTime(DateTime.now());
  
  final RestorableString _selectedTableType =
    RestorableString("A");

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRoute =
    RestorableRouteFuture(
        onComplete: _setDate,
        onPresent: (NavigatorState navigator, Object? arguments) {
          return navigator.restorablePush(
            Routes.datePickerRoute,
            arguments: _selectedDate.value.millisecondsSinceEpoch,
          );
        });

  late final RestorableRouteFuture<String?> _restorableTableTypeRoute =
    RestorableRouteFuture(
        onComplete: _setTableType,
        onPresent: (NavigatorState navigator, Object? arguments) {
          return navigator.restorablePush(Routes.tableTypeRoute,);
        }
    );

  List<Currency> currencyList = [];

  void getData() async {
    Response response = await get(
        Uri(
          scheme: 'http',
          host: 'api.nbp.pl',
          path: '/api/exchangerates/tables/${_selectedTableType.value}/${_selectedDate.value.toString().substring(0, 10)}',
        ),
        headers: {
          'Accept': 'application/json',
        }
    );
    currencyList = Currency.nbpJson2List(response.body.toString());
  }

  @override
  void initState() {
    super.initState();
    print("INIT STATE TABLES");

  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_selectedTableType, 'selected_table_type');
    registerForRestoration(_restorableDatePickerRoute, 'date_picker_future_route');
    registerForRestoration(_restorableTableTypeRoute, 'table_type_picker_future_route');
  }

  void _setDate(DateTime? newSelectedDate) {
    setState(() {
      if (newSelectedDate != null) {
        _selectedDate.value = newSelectedDate;
      }
    });
  }

  void _setTableType(String? newSelectedTableType) {
    setState(() {
      if(newSelectedTableType != null) {
        _selectedTableType.value = newSelectedTableType;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_selectedDate.value.toString().substring(0, 10) + " : " + _selectedTableType.value),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, Routes.aboutDialogRoute(context));
                },
                icon: Icon(Icons.help_outline_outlined,),
                tooltip: "How to use app",
            ),
          ],
        ),
        body: CurrencyList(currencies: currencyList,),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomAppBarButton(
                  label: "Select date",
                  icon: Icons.calendar_today_outlined,
                  onPressedCallback: _restorableDatePickerRoute.present,
              ),
              BottomAppBarButton(
                  label: "Select table type",
                  icon: Icons.table_rows_outlined,
                  onPressedCallback: _restorableTableTypeRoute.present,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              getData();
            });
          },
          child: Icon(Icons.refresh_outlined,)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class CurrencyList extends StatelessWidget {
  final List<Currency> currencies;

  const CurrencyList({
    Key? key,
    required this.currencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: currencies.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("1 ${currencies[index].code}"),
          subtitle: Text(currencies[index].name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currencies[index].rate.toString()),
              SizedBox(width: 8,),
              Text("PLN", style: TextStyle(color: Theme.of(context).accentColor)),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class BottomAppBarButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressedCallback;
  const BottomAppBarButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: IconButton(
            tooltip: label,
            icon: Icon(icon, semanticLabel: label,),
            onPressed: () => onPressedCallback(),
          ),
        ),
       /* Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(label, style: Theme.of(context).textTheme.bodyText2,),
        ),*/
      ],
    );
  }
}

/* FOR LATER

 */