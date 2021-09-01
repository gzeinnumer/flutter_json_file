import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReadJson(),
    );
  }
}

class ReadJson extends StatefulWidget {
  const ReadJson({Key? key}) : super(key: key);

  @override
  _ReadJsonState createState() => _ReadJsonState();
}

class _ReadJsonState extends State<ReadJson> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/content.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Container(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(_items[index]["fruit"]),
                    subtitle: Text('Color is : ' + _items[index]["color"]),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
