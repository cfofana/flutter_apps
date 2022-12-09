import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Manipulate json data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getLocation() {
    var lat = 35.0;
    var long = 139.0;
    getData(lat, long);
  }

  void getData(double latitude, double longitude) async {
    var api = '2244812b8712d3d86efee244320a9b12';
    var apiCall =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api';
    var apiCallAsUrl = Uri.parse(apiCall);
    http.Response resp = await http.get(apiCallAsUrl);
    if (resp.statusCode == 200) {
      String data = resp.body;
      // temperature, condition aka id, city name, icon
      var temp = jsonDecode(data)['main']['temp'];
      var condition = jsonDecode(data)['weather'][0]['id'];
      var cityName = jsonDecode(data)['name'];
      var icon = jsonDecode(data)['weather'][0]['icon'];
      log(data);
      log(temp.toString());
      log(condition.toString());
      log(cityName);
      log(icon);
    } else {
      log(resp.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Press me'),
        ),
      ),
    );
  }
}
