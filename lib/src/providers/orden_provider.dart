import 'dart:convert';
import 'package:http/http.dart' as http;
class OrdenProvider{

  Future<Map<String, dynamic>> createPost(String nombreCliente,int mesa, String orden, double total, String observacion )  async
 { 
  print("Entre al future");
  final ordenData = 
  {
    'nombre_cliente': nombreCliente,
    'mesa': mesa,
    'orden': orden,
    'total': total,
    'observacion': observacion
  };
  final resp = await http.post("http://antoniosalaices.pythonanywhere.com/orden/", headers: {"Content-Type": "application/json"}, body: json.encode(ordenData));
  print(json.encode(ordenData));
  Map<String, dynamic> decodedResp = json.decode(resp.body);
  print('Response status: ${resp.statusCode}');
  return { 'ok': true, 'token': decodedResp['total'] };
}


}


