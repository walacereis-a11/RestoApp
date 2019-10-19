import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:restaurante/src/providers/productos_provider.dart';
import 'package:restaurante/src/widgets/card_swiper_widget.dart';
class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text('Platillos'),
       elevation: 50,
       backgroundColor: Colors.red,
       actions: <Widget>[
         IconButton(
          icon: Icon(Icons.search),
          onPressed: (){

          },
         )
       ],
     ),
     body: Container(
       child: Column( 
         children: <Widget>[ 
           _swiperTarjetas()
         ],
       ),
     ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder( 
      future: productosProvider.getPlatillos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
            return CardSwiper(productos: snapshot.data);
        }else{
            return Container(height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              )
          );
        }
      },
    );
    
  }
}