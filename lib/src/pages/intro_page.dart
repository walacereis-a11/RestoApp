import 'package:flutter/material.dart';
import 'package:restaurante/src/widgets/card_swiper_widget.dart';


class IntroPage extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      )
    );
  }
  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
          Color.fromRGBO(220, 142, 24, 1.0),
          Color.fromRGBO(249, 163, 33, 1.0)
        ]
        )
      ),
    );
    final circulo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),

    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top:90.0, left:30.0, child: circulo),
        Positioned(top:-40.0, left:-30.0, child: circulo),
        Positioned(top:-50.0, left:-10.0, child: circulo),
        Positioned(top:120.0, left:20.0, child: circulo),
        Positioned(top:-50.0, left:-20.0, child: circulo),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage('assets/Icono.png'), height: 90.0,),
              SizedBox(height: 10.0, width: double.infinity),
              Text('RestoApp', style: TextStyle(fontSize: 25.0, color: Colors.white))
            ],
          ),
        )
      ]
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0 ),
                _crearEmail(  ),
                SizedBox( height: 30.0 ),
                _crearPassword(  ),
                SizedBox( height: 30.0 ),
                _crearBoton( context )
              ],
            ),
          ),
          Text('¿Olvidó la contraseña?'),
          SizedBox( height: 100.0 ),
        ],
      ),
    );

  }

  Widget _crearEmail() {


    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.orange ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            // errorText: snapshot.error
          ),
        ),
      );
  }

  Widget _crearPassword() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon( Icons.lock_outline, color: Colors.orange ),
            labelText: 'Contraseña',
            // errorText: snapshot.error
          ),
        ),
      );
  }

  Widget _crearBoton(BuildContext context) {

    return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.red,
          textColor: Colors.white,
          onPressed: ()=> Navigator.pushNamed(context, 'Category'),
        );
  }
}
