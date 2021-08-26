import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Table no."),
                Text("165/A/NBP/2021"),
              ],
            ),
            Row(
              children: [
                Text("Table date"),
                Text("26.08.2021"),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          "EUR",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "1.00",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.lime,
                    child: Column(
                      children: [
                        Text(
                          "PLN",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "${randomExchangeRates[0]}",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          "USD",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "1.00",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.lime,
                    child: Column(
                      children: [
                        Text(
                          "PLN",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "${randomExchangeRates[1]}",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          "AUD",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "1.00",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.lime,
                    child: Column(
                      children: [
                        Text(
                          "PLN",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "${randomExchangeRates[2]}",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //color: Colors.grey,
                    child: Column(
                      children: [
                        Text(
                          "CHF",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "1.00",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: Colors.lime,
                    child: Column(
                      children: [
                        Text(
                          "PLN",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "${randomExchangeRates[3]}",
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        )
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
