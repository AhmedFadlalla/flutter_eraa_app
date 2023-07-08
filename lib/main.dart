import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/bloc_observer.dart';
import 'package:flutter_test_app/const/cach_helper/cach_helper.dart';
import 'package:flutter_test_app/const/component/constabt.dart';
import 'package:flutter_test_app/const/dio/dio_helper.dart';
import 'package:flutter_test_app/screens/chat_app/chat_home_screen/chat_home_screen.dart';
import 'package:flutter_test_app/screens/chat_app/login_screen/login_screen.dart';
import 'package:flutter_test_app/screens/note_app/note_screen/note_screen.dart';
import 'package:flutter_test_app/screens/todo_screen/to_do_screen.dart';
import 'package:flutter_test_app/screens/world_timer_app/cubit/world_timer_cubit.dart';
import 'package:flutter_test_app/screens/world_timer_app/screens/choose_region_screen.dart';

import 'SCREENS/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await DioHelper.init();
  await CachHelper.init();

  userName=CachHelper.getData(key: "name");

  print("user name ${userName}");
  Widget? widget;
  if(userName!=null){
    widget=ChatHomeScreen();
  }else{
    widget=LoginScreen();
  }
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,
  required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home:  NoteScreen(),
    );
  }
}

