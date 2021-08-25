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
        child: ElevatedButton.icon(
            onPressed: () => print("You Pressed Add Button!"),
            icon: Icon(
              Icons.add_circle_outline,
            ),
            label: Text("Add"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Button"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
