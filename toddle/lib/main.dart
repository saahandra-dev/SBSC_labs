import 'package:flutter/material.dart';
import 'package:toddle/homepage.dart';

void main() {
  runApp(const Toddle());
}

class Toddle extends StatelessWidget {
  const Toddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage()
    );
  }
}

