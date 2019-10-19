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
        SizedBox(height: 30.0),
        ListTile(
          contentPadding: EdgeInsets.only(bottom:60.0),
          title: Text('Platillos', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
          subtitle: Text('Aquí están los platillos fuertes.'),
          leading: Icon(Icons.restaurant),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap:()=> Navigator.pushNamed(context, 'Home'),
        ),
        Divider(color: Colors.red),
        SizedBox(height: 30.0),
        ListTile(
          contentPadding: EdgeInsets.only(bottom:60.0),
          title: Text('Bebidas',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
          subtitle: Text('Aquí están las bebidas'),
          leading: Icon(Icons.local_drink),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap:()=> Navigator.pushNamed(context, 'Drinks'),
        ),
        Divider(color: Colors.red),
        SizedBox(height: 30.0),
        ListTile(
          contentPadding: EdgeInsets.only(bottom:60.0),
          title: Text('Aperitivos',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              )),
          subtitle: Text('Aquí están los aperitivos.'),
          leading: Icon(Icons.restaurant),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap:()=> Navigator.pushNamed(context, 'Aperitivos'),
        ),
        Divider(color: Colors.red),
      ],
    );
  }

  
}