import 'package:exam/pages/all.dart';
import 'package:exam/pages/create.dart';
import 'package:exam/pages/detail.dart';
import 'package:exam/pages/edit.dart';
import 'package:exam/pages/online.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/nav.dart';
import 'pages/testConnexion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: {
        'nav':(context)=>Nav(),
        'detail':(context)=>Detail(),
        'all':(context) =>All(),
        'online':(context)=>Online(),
        'create':(context)=>CreateResto(),
        'edit':(context)=> Edit()
      },
    );
  }
}
