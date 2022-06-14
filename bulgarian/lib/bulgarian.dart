import 'package:flutter/material.dart';

class Bulgarian extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD8D583),
      appBar: AppBar(
        backgroundColor: const Color(0xff720017),
        title: Center(child: const Text('My Bulgarian Words')),
      ),
      body: const Center(
        child: const Image(
          image: AssetImage('../images/bulgarian_flag_large.png'),
        ),
      ),
    );
  }
}
