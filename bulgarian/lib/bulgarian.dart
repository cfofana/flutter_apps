import 'package:flutter/material.dart';
//import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class Bulgarian extends StatelessWidget {
  const Bulgarian({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<String> myList = [
      'dobre',
      'mnogo',
      'den',
      'esenen',
      'blagodarya'
    ];

    return Scaffold(
      backgroundColor: const Color(0xffD8D583),
      appBar: AppBar(
        backgroundColor: const Color(0xff720017),
        flexibleSpace: Image(
          image: AssetImage('images/bulgarian-metallic-flag.jpg'),
        ),
        title: const Center(child: Text('My Bulgarian Words')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('fkdjls');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bulgarian-metallic-flag.jpg'),
          ),
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                String url = 'https://flutter.dev';
                //html.window.open(url, '_blank');
              },
              child: Text('Image by: '),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    child: Text(
                      (index + 1).toString() + " " + myList[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before), label: 'Go Back'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next), label: 'Next'),
        ],
      ),
    );
  }
}

//TODO
// use List Widget DONE
// create list DONE
// image attribution
// put flag in app bar DONE
// use background image DONE
// create listview of words DONE
// add appbar icon   DONE
// add bottom navigation DONE
// to settings.json "editor.suggestOnTriggerCharacters": false
