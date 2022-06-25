import 'package:flutter/material.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/homepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Montserrat"),
      routes: {
        'homepage': (context) => Homepage(),
        'add_todo': (context) => AddTodo()
      },
      initialRoute: 'homepage', // mengatur tampilan layar pertama
    );
  }
}
