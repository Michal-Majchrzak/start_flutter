import 'package:flutter/material.dart';
import 'package:start_flutter/routes.dart';
import 'package:start_flutter/currency.dart';

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
          title: Text(currencies[index].code),
          subtitle: Text(currencies[index].name),
          trailing: Text(currencies[index].rate.toString()),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class DisplayTableScreen extends StatefulWidget {
  const DisplayTableScreen({Key? key,}) : super(key: key);

  @override
  _DisplayTableScreenState createState() => _DisplayTableScreenState();
}

class _DisplayTableScreenState extends State<DisplayTableScreen> {
  // TEMP
  String jsonData = '{"table":"A","no":"166/A/NBP/2021","effectiveDate":"2021-08-27","rates":[{"currency":"bat (Tajlandia)","code":"THB","mid":0.1194},{"currency":"dolar amerykański","code":"USD","mid":3.8978},{"currency":"dolar australijski","code":"AUD","mid":2.8273},{"currency":"dolar Hongkongu","code":"HKD","mid":0.5004},{"currency":"dolar kanadyjski","code":"CAD","mid":3.0760},{"currency":"dolar nowozelandzki","code":"NZD","mid":2.7110},{"currency":"dolar singapurski","code":"SGD","mid":2.8841},{"currency":"euro","code":"EUR","mid":4.5803},{"currency":"forint (Węgry)","code":"HUF","mid":0.013059},{"currency":"frank szwajcarski","code":"CHF","mid":4.2442},{"currency":"funt szterling","code":"GBP","mid":5.3405},{"currency":"hrywna (Ukraina)","code":"UAH","mid":0.1447},{"currency":"jen (Japonia)","code":"JPY","mid":0.035396},{"currency":"korona czeska","code":"CZK","mid":0.1793},{"currency":"korona duńska","code":"DKK","mid":0.6159},{"currency":"korona islandzka","code":"ISK","mid":0.030782},{"currency":"korona norweska","code":"NOK","mid":0.4414},{"currency":"korona szwedzka","code":"SEK","mid":0.4470},{"currency":"kuna (Chorwacja)","code":"HRK","mid":0.6116},{"currency":"lej rumuński","code":"RON","mid":0.9280},{"currency":"lew (Bułgaria)","code":"BGN","mid":2.3418},{"currency":"lira turecka","code":"TRY","mid":0.4646},{"currency":"nowy izraelski szekel","code":"ILS","mid":1.2069},{"currency":"peso chilijskie","code":"CLP","mid":0.004953},{"currency":"peso filipińskie","code":"PHP","mid":0.0780},{"currency":"peso meksykańskie","code":"MXN","mid":0.1911},{"currency":"rand (Republika Południowej Afryki)","code":"ZAR","mid":0.2614},{"currency":"real (Brazylia)","code":"BRL","mid":0.7420},{"currency":"ringgit (Malezja)","code":"MYR","mid":0.9303},{"currency":"rubel rosyjski","code":"RUB","mid":0.0527},{"currency":"rupia indonezyjska","code":"IDR","mid":0.00027035},{"currency":"rupia indyjska","code":"INR","mid":0.052762},{"currency":"won południowokoreański","code":"KRW","mid":0.003332},{"currency":"yuan renminbi (Chiny)","code":"CNY","mid":0.6016},{"currency":"SDR (MFW)","code":"XDR","mid":5.5316}]}';
  // TEMP
  List<Currency> currencies = [];

  @override
  void initState() {
    super.initState();
    currencies = Currency.nbpJson2List(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Display Table Screen"),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, Routes.settings),

                icon: Icon(Icons.settings)),
          ],
        ),
        body: CurrencyList(currencies: currencies,),
      ),
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