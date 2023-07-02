import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/bloc_observer.dart';
import 'package:flutter_test_app/screens/todo_screen/to_do_screen.dart';

import 'SCREENS/home_screen.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ToDoScreen(),
    );
  }
}

