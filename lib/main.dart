import 'package:flutter/material.dart';
import 'package:restaurante/src/pages/aperitivo_page.dart';
import 'package:restaurante/src/pages/category_page.dart';
import 'package:restaurante/src/pages/drink_page.dart';
import 'package:restaurante/src/pages/home_page.dart';
import 'package:restaurante/src/pages/intro_page.dart';
import 'package:restaurante/src/pages/orden_page.dart';
import 'package:restaurante/src/pages/producto_detalle.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'RestoApp',
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) =>IntroPage(),
        'Home' :(BuildContext context) => HomePage(),
        'Category': (BuildContext context) => CategoryPage(),
        'Drinks' : (BuildContext context) => DrinkPage(),
        'Aperitivos': (BuildContext context) => AperitivoPage(),
        'Orden':(BuildContext context) => OrdenPage(),
        'Detalle':(BuildContext context) => ProductoDetalle(),
      },
    );
  }
}
