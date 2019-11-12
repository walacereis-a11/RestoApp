// Generated by https://quicktype.io
class Productos{
  List<Producto> items = new List();
  Productos();

  Productos.fromJsonList(List<dynamic> jsonList ){
    if(jsonList==null) return;

    for(var item in jsonList)
    {
      final producto = new Producto.fromJsonMap(item);
      items.add(producto);
    }
  }
}


class Producto {

  String uniqueId;

  int id;
  String nombre;
  String descripcion;
  double precio;
  String imagen;
  int categoria;

  Producto({
    this.id,
    this.nombre,
    this.descripcion,
    this.precio,
    this.imagen,
    this.categoria,
  });
  Producto.fromJsonMap(Map<String, dynamic> json)
    {
    id           = json['id'];
    nombre       = json['nombre'];
    descripcion  = json['descripcion'];
    precio       = json['precio'];
    imagen       = json['imagen'];
    categoria    = json['categoria'];
  }
  getPosterImg(){
    if(imagen==null){
      return 'http://textiletrends.in/gallery/1547020644No_Image_Available.jpg';
    }else{
      return 'http://antoniosalaices.pythonanywhere.com$imagen';
    }
  }
}
