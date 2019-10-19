import 'package:flutter/material.dart';
import 'package:restaurante/src/providers/orden_provider.dart';
class OrdenPage extends StatefulWidget {
  @override
  _OrdenPageState createState() => _OrdenPageState();
}

class _OrdenPageState extends State<OrdenPage> {
  String nombre = '';
  int mesa;
  String orden = '';
  double total;
  String observacion = '';

  final ordenProvider = new OrdenProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orden'),
        elevation: 50,
        backgroundColor: Colors.red,
      ),
      body: ListView(
                padding: EdgeInsets.symmetric(horizontal:10.0 ,vertical:40.0 ),
                children: <Widget>[
                    _crearNombre(),
                    Divider(),
                    _crearMesa(),
                    Divider(),
                    _crearOrden(),
                    Divider(),
                    _crearTotal(),
                    Divider(),
                    _crearObservacion(),
                    StreamBuilder(
                      builder:(BuildContext context, AsyncSnapshot snapshot){
                        return RaisedButton(
                          child: Text('Confirmar orden'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: ()=> _register(context)
                        );
                      }
                    )
                ],
    ),
    );
  }
Widget _crearNombre() {


    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre del cliente',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.accessibility),
        helperText: 'Sólo es el nombre',
      ),
      onChanged: (valor){
        setState(() {
          nombre = valor;
        });
      },
    );
  }

  _register(BuildContext context) async {
  print("Etre aqui");
  final info = await ordenProvider.createPost(nombre, mesa, orden, total, observacion);
  print(info);
  }

  Widget _crearMesa() {

    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Número de mesa',
        labelText: 'Mesa',
        suffixIcon: Icon(Icons.tab),
        helperText: 'Sólo es el número de mesa',
      ),
      onChanged: (valor){
        setState(() {
          mesa = int.parse(valor);
        });
      },
    );
  }

  Widget _crearOrden() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Orden de la mesa',
        labelText: 'Orden',
        suffixIcon: Icon(Icons.menu),
      ),
      onChanged: (valor){
        setState(() {
          orden = valor;
        });
      },
    );

  }

  Widget _crearTotal() {
    
    return TextField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Total de la cuenta',
        labelText: 'Total',
        suffixIcon: Icon(Icons.monetization_on),
        helperText: 'Sólo es el total',
      ),
      onChanged: (valor){
        setState(() {
          total = double.parse(valor);
        });
      },
    );
  }

  Widget _crearObservacion() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Detalles de la orden',
        labelText: 'Detalles',
        suffixIcon: Icon(Icons.font_download),
      ),
      onChanged: (valor){
        setState(() {
          observacion = valor;
        });
      },
    );

  }



}
 
