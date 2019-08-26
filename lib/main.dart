import 'package:flutter/material.dart';
import 'package:magazinelu/src/Home/home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(0xff0086ff)),

    );
  }
}
