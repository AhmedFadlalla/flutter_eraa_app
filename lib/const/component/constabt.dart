import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstant{

  static navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}

String? userName;