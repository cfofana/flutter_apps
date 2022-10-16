import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Screen 0'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: launchPage,
              child: Text('Click me!'),
            ),
            Link(
              uri: Uri.parse('https://flutter.dev'),
              target: LinkTarget.blank,
              builder: (context, followLink) {
                return ElevatedButton(
                  child: Text('Hello'),
                  onPressed: followLink,
                );
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Go To Screen 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Go To Screen 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}

void launchPage() {
  launchUrl(
    Uri.parse('https://google.com'),
    mode: LaunchMode.externalApplication,
  );
}
