import 'package:flutter/material.dart';
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
    RestorableDateTime(DateTime(2021, 1, 1));
  
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


  // TEMP
  String jsonData = '{"table":"A","no":"166/A/NBP/2021","effectiveDate":"2021-08-27","rates":[{"currency":"bat (Tajlandia)","code":"THB","mid":0.1194},{"currency":"dolar amerykański","code":"USD","mid":3.8978},{"currency":"dolar australijski","code":"AUD","mid":2.8273},{"currency":"dolar Hongkongu","code":"HKD","mid":0.5004},{"currency":"dolar kanadyjski","code":"CAD","mid":3.0760},{"currency":"dolar nowozelandzki","code":"NZD","mid":2.7110},{"currency":"dolar singapurski","code":"SGD","mid":2.8841},{"currency":"euro","code":"EUR","mid":4.5803},{"currency":"forint (Węgry)","code":"HUF","mid":0.013059},{"currency":"frank szwajcarski","code":"CHF","mid":4.2442},{"currency":"funt szterling","code":"GBP","mid":5.3405},{"currency":"hrywna (Ukraina)","code":"UAH","mid":0.1447},{"currency":"jen (Japonia)","code":"JPY","mid":0.035396},{"currency":"korona czeska","code":"CZK","mid":0.1793},{"currency":"korona duńska","code":"DKK","mid":0.6159},{"currency":"korona islandzka","code":"ISK","mid":0.030782},{"currency":"korona norweska","code":"NOK","mid":0.4414},{"currency":"korona szwedzka","code":"SEK","mid":0.4470},{"currency":"kuna (Chorwacja)","code":"HRK","mid":0.6116},{"currency":"lej rumuński","code":"RON","mid":0.9280},{"currency":"lew (Bułgaria)","code":"BGN","mid":2.3418},{"currency":"lira turecka","code":"TRY","mid":0.4646},{"currency":"nowy izraelski szekel","code":"ILS","mid":1.2069},{"currency":"peso chilijskie","code":"CLP","mid":0.004953},{"currency":"peso filipińskie","code":"PHP","mid":0.0780},{"currency":"peso meksykańskie","code":"MXN","mid":0.1911},{"currency":"rand (Republika Południowej Afryki)","code":"ZAR","mid":0.2614},{"currency":"real (Brazylia)","code":"BRL","mid":0.7420},{"currency":"ringgit (Malezja)","code":"MYR","mid":0.9303},{"currency":"rubel rosyjski","code":"RUB","mid":0.0527},{"currency":"rupia indonezyjska","code":"IDR","mid":0.00027035},{"currency":"rupia indyjska","code":"INR","mid":0.052762},{"currency":"won południowokoreański","code":"KRW","mid":0.003332},{"currency":"yuan renminbi (Chiny)","code":"CNY","mid":0.6016},{"currency":"SDR (MFW)","code":"XDR","mid":5.5316}]}';

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
    print('building main widget');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_selectedDate.value.toString() + " : " + _selectedTableType.value),),
        body: CurrencyList(currencies: Currency.nbpJson2List(jsonData),),
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
          onPressed: (){},
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
          leading: Icon(Icons.flag_outlined),
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
            icon: Icon(icon),
            onPressed: () => onPressedCallback(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(label, style: Theme.of(context).textTheme.bodyText2,),
        ),
      ],
    );
  }
}

/* FOR LATER
void getData() async {
    Response response = await get(
        Uri(
          scheme: 'http',
          host: 'api.nbp.pl',
          path: '/api/exchangerates/tables/a/',
        ),
        headers: {
          'Accept': 'application/json',
        }
        );
    print(response.body);
  }
 */