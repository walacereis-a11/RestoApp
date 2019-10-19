import 'dart:convert';

import 'package:restaurante/src/models/platillos_model.dart';
import 'package:http/http.dart' as http;


class ProductosProvider{
  String _url= 'http://antoniosalaices.pythonanywhere.com/listado/?categoria=platillo';

  Future<List<Producto>> getPlatillos() async{
    // final url = Uri.https(_url, 'listado/?categoria=platillo');
    final resp = await http.get(_url); 
    final decodedData = json.decode(resp.body);
    final productos = new Productos.fromJsonList(decodedData);
  
    return productos.items;
  } 
  
}
class BebidasProvider{
  String _url= 'http://antoniosalaices.pythonanywhere.com/listado/?categoria=bebida';

  Future<List<Producto>> getBebidas() async{
    // final url = Uri.https(_url, 'listado/?categoria=bebida');
    final resp = await http.get(_url); 
    final decodedData = json.decode(resp.body); 
    final productos = new Productos.fromJsonList(decodedData);
  
    return productos.items;
  } 
  
}

class AperitivoProvider{
  String _url= 'http://antoniosalaices.pythonanywhere.com/listado/?categoria=aperitivo';

  Future<List<Producto>> getAperitivo() async{
    // final url = Uri.https(_url, 'listado/?categoria=aperitivo');
    final resp = await http.get(_url); 
    final decodedData = json.decode(resp.body);
    final productos = new Productos.fromJsonList(decodedData);
  
    return productos.items;
  } 
  
}