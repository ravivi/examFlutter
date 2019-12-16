import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/admin_resto.dart';
import './pages/all.dart';
import './pages/create.dart';
import './pages/createOnline.dart';
import './pages/detail.dart';
import './pages/edit.dart';
import './provider/resto_provider.dart';
import 'pages/login.dart';
import 'pages/nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Restos(),)
      ],
      child: MaterialApp(
        title: 'Restaurant',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        routes: {
          'nav':(context)=>Nav(),
          'modifier':(context)=>EditResto(),
          'edit':(context)=>EditResto(),
          'detail':(context)=>PageSilv(),
          'all':(context) =>All(),
          'create':(context)=>CreateResto(),
          'createOnline':(context)=>CreateRestoOnline(),
          'editOffline':(context)=> Edit(),
          'edit0nline':(context)=> AdminRestoScreen()
        },
      ),
    );
  }
}
