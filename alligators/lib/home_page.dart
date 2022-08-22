import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alligator_module.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Alligator> alligators = [
    Alligator('Facebook', Icons.facebook),
    Alligator('Instagram', Icons.facebook),
    Alligator('SnapChat', Icons.snapchat),
  ];
  // Widget socialMediaButton({
  //   required IconData icon,
  //   required VoidCallback onClicked,
  // }) =>
  //     InkWell(
  //       child: Container(
  //         child: Center(
  //           child: Icon(icon),
  //         ),
  //       ),
  //       onTap: onClicked,
  //     );

  void shareProfile() {
    Share.share('page1.dart');

    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    // OverlayState overlayState = Overlay.of(context);
    // OverlayEntry overlayEntry;
    // overlayEntry = OverlayEntry(builder: (context) {};)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('The Alligators'),
        ),
        body: Container(
          child: CupertinoButton.filled(
            child: Icon(Icons.share),

            // onPressed: shareProfile
            onPressed: () {
              shareProfile();
            },
            // child: Column(
            //   children: alligators
            //       .map(
            //         (Alligator alligator) => Card(
            //           child: ListTile(
            //             title: Text(alligator.name),
            //             leading: Icon(alligator.socialMediaIcon),
            //             onTap: () => Share.share(
            //                 'check out my website https://www.google.com'),
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
          ),
        ),
      ),
    );
  }
}
