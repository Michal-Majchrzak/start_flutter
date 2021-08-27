import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> randomExchangeRates = [1, 2, 3, 4];

  List<int> generateRandomRates() {
    List<int> returnList = [0, 0, 0, 0];
    Random random = Random();
    int min = 1;
    int max = 100;
    for (int i = 0; i < returnList.length; i++) {
      returnList[i] = min + random.nextInt(max - min);
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Exchange Rates"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            HeaderRow(tableName: "165/A/NBP/2021", tableDate: "26.08.2021",),
            Divider(),
            CurrencyCard(currencyCode: "EUR", currencyName: "euro", randomExchangeRates: randomExchangeRates[0],),
            CurrencyCard(currencyCode: "USD", currencyName: "united states dolar", randomExchangeRates: randomExchangeRates[1],),
            CurrencyCard(currencyCode: "AUD", currencyName: "australian dolar", randomExchangeRates: randomExchangeRates[2],),
            CurrencyCard(currencyCode: "NOK", currencyName: "norwegian koron", randomExchangeRates: randomExchangeRates[3],),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          randomExchangeRates = generateRandomRates();
        }),
        child: Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  final int randomExchangeRates;
  final String currencyCode;
  final String currencyName;

  const CurrencyCard({
    Key? key,
    required this.randomExchangeRates,
    required this.currencyCode,
    required this.currencyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: EdgeInsets.all(21.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.lime,
                  child: Icon(
                      Icons.account_balance_outlined
                  ),
                ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currencyCode,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      currencyName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.red,
                child: Text("$randomExchangeRates"),
              ),
            ),
          ],
          ),
        ),
      );
  }
}

class HeaderRow extends StatelessWidget {
  final String tableName;
  final String tableDate;

  const HeaderRow({
    Key? key,
    required this.tableName,
    required this.tableDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: "Table no", textColor: Colors.black54,),
              SizedBox(height: 4.0,),
              HeaderText(text: "Table date", textColor: Colors.black54,),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: tableName, textColor: Colors.black,),
              SizedBox(height: 4.0,),
              HeaderText(text: tableDate, textColor: Colors.black,),
            ],
          ),
        ),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  final Color textColor;
  const HeaderText({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
