import 'package:flutter/material.dart';
import 'package:restaurante/src/providers/orden_provider.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
       centerTitle: false,
       title: Text('Menú'),
       elevation: 50,
       backgroundColor: Colors.red,
       actions: <Widget>[
         IconButton(
          icon: Icon(Icons.restaurant_menu),
          onPressed: () => Navigator.pushNamed(context, 'Orden'),
         )
       ],
     ),
     body: _lista(context),
    );
  }
   
  Widget _lista(BuildContext context) {
    return ListView(
      children: <Widget>[
        SafeArea(
            child: Container(
              height: 80.0,
            ),
          ),
        SizedBox(height: 30.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            textColor: Colors.white,
            child: Row(
              children: <Widget>[
              SafeArea(
                  child: Container(
                    width: 130.0,
                  ),
                ),
              Icon(Icons.restaurant),
              SizedBox(width: 10.0),
              Text('Platillos',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
              
              ],
            ),
            onPressed: ()=> Navigator.pushNamed(context, 'Home'),
            color: Colors.red,
          )

        ),
        Divider(color: Colors.red),
        SizedBox(height: 30.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            textColor: Colors.white,
            child: Row(
              children: <Widget>[
              SafeArea(
                  child: Container(
                    width: 130.0,
                  ),
                ),
              Icon(Icons.local_drink),
              SizedBox(width: 10.0),
              Text('Bebidas',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
              
              ],
            ),
            onPressed: ()=> Navigator.pushNamed(context, 'Drinks'),
            color: Colors.red,
          )

        ),
        Divider(color: Colors.red),
        SizedBox(height: 30.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            textColor: Colors.white,
            child: Row(
              children: <Widget>[
              SafeArea(
                  child: Container(
                    width: 130.0,
                  ),
                ),
              Icon(Icons.fastfood),
              SizedBox(width: 10.0),
              Text('Aperitivos',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
              
              ],
            ),
            onPressed: ()=> Navigator.pushNamed(context, 'Aperitivos'),
            color: Colors.red,
          )

        ),
        Divider(color: Colors.red),
      ],
    );
  }

  
}