import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hello World title'),
            backgroundColor: Colors.green,
          ),
          body: Text('Hello World')),
    );
  }
}
