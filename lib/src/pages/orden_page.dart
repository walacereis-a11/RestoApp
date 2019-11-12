import 'package:flutter/material.dart';
import 'package:restaurante/src/pages/producto_detalle.dart';
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
                    ),
                    RaisedButton(
                          child: Text('Borrar orden'),
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: ()=> _borrarOrden(context)
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
  if(info['ok']==true){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Text('Confirmación de envío'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Text('La orden fue enviada con éxito.'),
                    Icon(Icons.check, size: 100.0)
                ],
              ),
              actions: <Widget>[
                FlatButton( 
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
        }
      );
  }else
  {
  showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){

              return AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                title: Text('Confirmación de envío'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                      Text('La orden no se envió con éxito.'),
                      Icon(Icons.close, size: 100.0)
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
          }
        );

  }
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
        suffixIcon: Icon(Icons.people),
        helperText: 'Sólo es el número de mesa',
      ),
      onChanged: (valor){
        setState(() {
          mesa = int.parse(valor);
        });
      },
    );
  }


  Widget _crearTotal() {
    total = totalorden;
    orden = ordenCompleta;
    return ListTile(
      title: Text('El total es: $totalorden'),
      subtitle: Text('La orden es: $ordenCompleta'),
      
    );
    
    // onChanged: (valor){
    //     setState(() {
    //       total = double.parse(valor);
    //     });
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
        suffixIcon: Icon(Icons.assignment),
      ),
      onChanged: (valor){
        setState(() {
          observacion = valor;
        });
      },
    );

  }

  _borrarOrden(BuildContext context) {
    
    setState(() {
    ordenCompleta="";
    totalorden = 0;   
    });
  }
  


}
 
