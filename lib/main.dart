import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar Widget"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Image.asset('assets/images/mountain1.jpg'),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Button"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
