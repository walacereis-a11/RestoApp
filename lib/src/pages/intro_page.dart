import 'package:flutter/material.dart';
import 'package:restaurante/src/widgets/card_swiper_widget.dart';


class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 250, horizontal:115),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('RestoApp', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              )),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                child: FadeInImage(
                    width: 140,
                    height: 140,
                    fadeInDuration: Duration(seconds: 3),
                    image: AssetImage('assets/Icono.png'),
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    fit: BoxFit.cover,
                ),
                onTap:()=> Navigator.pushNamed(context, 'Category'), 
              ),
            ),
            Text('Bienvenido', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:36, 
              ))
          ],
        ),
      ),
      );
  }
}