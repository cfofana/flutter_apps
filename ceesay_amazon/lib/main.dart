import 'package:ceesay_amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalVariables globalVar = new GlobalVariables();
    return MaterialApp(
      title: 'Ceesay\'s Amazon',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('App'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Flutter Demo Home Page'),
            ),
            ElevatedButton(
              onPressed: () {
                print('ive been cllicked');
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
