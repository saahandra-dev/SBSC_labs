import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/screens/todo_list.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: TodoListScreen(),
    );
  }
}
