import 'package:flutter/material.dart';
import 'package:to_do_app_using_flutter/HomeScreen/app_home_screen.dart';

void main(){
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget{
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ToDoApp",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent)),
      home: ToDoAppHomeScreen(),
    );
  }
}