import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                          "4.5684",
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
                          "3.5004",
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
                          "2.3384",
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
                          "0.005684",
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
        onPressed: (){},
        child: Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
