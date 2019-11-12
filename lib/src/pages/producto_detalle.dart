import 'package:flutter/material.dart';
import 'package:restaurante/src/models/platillos_model.dart';

class ProductoDetalle extends StatefulWidget {
  
  @override
  _ProductoDetalleState createState() => _ProductoDetalleState();
}
String ordenCompleta = "";
double totalorden = 0;
int _conteo = 0;
class _ProductoDetalleState extends State<ProductoDetalle> {
  @override
  Widget build(BuildContext context) {
    
    final Producto producto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(producto),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _posterPlatillo(context, producto),
                  SizedBox(height: 20.0),
                  Text('¿Cuantos desea?',textAlign: TextAlign.center,  style: TextStyle(fontSize: 30.0, fontWeight:FontWeight.bold)),
                  SizedBox(height: 20.0),
                  Text( '$_conteo'  , textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, fontWeight:FontWeight.bold) ),                
                ]
              ),
            )
          ],
        ),
        ),
      floatingActionButton: _anadirOrden(producto)
    );
  }

  Widget _crearAppBar(Producto producto) {

    return SliverAppBar(
      actions: <Widget>[
         IconButton(
          icon: Icon(Icons.restaurant_menu),
          // onPressed: () => Navigator.pushNamed(context, 'Orden'),

         )
       ],
      elevation: 20.0,
      backgroundColor: Colors.red,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(producto.nombre),
      ),
    );
  }

 Widget _posterPlatillo(BuildContext context, Producto producto) {

   return Container(
     padding: EdgeInsets.symmetric(horizontal:20.0),
     child: Row(
       children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(producto.getPosterImg()),
              height: 150.0,
            ),
          ),
        SizedBox(width: 20.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(producto.nombre, style: Theme.of(context).textTheme.title),
              Text(producto.precio.toString(), style: Theme.of(context).textTheme.title),
              Text(producto.descripcion, style: Theme.of(context).textTheme.subhead),
            ],
          ),
        )
       ],
     ),
   );
  }

  _anadirOrden( Producto producto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // FloatingActionButton(heroTag: 'bnr', 
        // child: Text('Agregar'), 
        // onPressed: _send(producto), 
        // backgroundColor: Colors.redAccent[700], 
        // ),
        RaisedButton(
        
        child: Text('Agregar'),
        textColor: Colors.white, 
        onPressed: (){
          _send(producto);
          Navigator.pop(context);
        }, 
        color: Colors.blue[700], 
        ),
        SizedBox(width:120.0),
        FloatingActionButton(heroTag: 'bns', child: Icon(Icons.remove ), onPressed: _sustraer, backgroundColor: Colors.red ),
        SizedBox( width: 5.0 ),
        FloatingActionButton(heroTag: 'bna', child: Icon(Icons.add ), onPressed: _agregar, backgroundColor: Colors.green, ),
      ],
    );
  }

  void _agregar() {
      setState(() => _conteo++ );
  }

  void _sustraer() {
      setState(() => _conteo-- );

  }

   _send(Producto producto) {
    
     
    totalorden += _conteo * producto.precio;
    
    ordenCompleta += _conteo.toString()+" "+producto.nombre+", ";
    setState(() => _conteo = 0 );
   
    // Navigator.of(context).pop();
  }
}