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

  Expanded buildKey(int fileNumber, int keyColor) {
    return Expanded(
      child: FlatButton(
        color: Color(keyColor),
        onPressed: () {
          playSound(fileNumber);
        },
      ),
    );
  }

//color: Color(),
//  color: Color(),
  //color: Color(),
  //color: Color(),
  //color: Color(),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, 0xff355070),
              buildKey(2, 0xff6D597A),
              buildKey(3, 0xffB56576),
              buildKey(4, 0xffE56B6F),
              buildKey(5, 0xffEAAC8B),
              buildKey(6, 0xff843b62),
              buildKey(7, 0xff621940),
            ],
          ),
        ),
      ),
    );
  }
}
