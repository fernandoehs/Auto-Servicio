import 'package:autoservicio/src/pages/grid_page.dart';
import 'package:autoservicio/src/pages/home_page.dart';
import 'package:autoservicio/src/pages/aceite.dart';
//import 'package:autoservicio/src/pages/bujia.dart';
//import 'package:autoservicio/src/pages/pruebamain.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Autos',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) =>HomePage(),
        'producto': (BuildContext context) => ProductPage(),
        'aceite':(BuildContext context) => AceitePage(),
        //'prueba':(BuildContext context) => SamplePage(),
             },
      
    );
  }
}

