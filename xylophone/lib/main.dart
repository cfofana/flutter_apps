// @dart=2.9
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int i) {
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
    audioPlayer.open(
      Audio('../assets/note$i.wav'),
      showNotification: true,
    );
  }

  Widget buildKey() {
    Expanded(
      child: FlatButton(
        color: Color(0xff355070),
        onPressed: () {
          playSound(1);
        },
      ),
    );
  }

//color: Color(0xff6D597A),
//color: Color(0xffB56576),
//  color: Color(0xffE56B6F),
  //color: Color(0xffEAAC8B),
  //color: Color(0xff843b62),
  //color: Color(0xff621940),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(),
              buildKey(),
              buildKey(),
              buildKey(),
              buildKey(),
              buildKey(),
              buildKey(),
            ],
          ),
        ),
      ),
    );
  }
}
