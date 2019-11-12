import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:restaurante/src/providers/productos_provider.dart';
import 'package:restaurante/src/widgets/card_swiper_widget.dart';
class DrinkPage extends StatelessWidget {
  final drinkProvider = new BebidasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text('Bebidas'),
       elevation: 50,
       backgroundColor: Colors.red,
       actions: <Widget>[
        //  IconButton(
        //   icon: Icon(Icons.search),
        //   onPressed: (){

        //   },
        //  )
       ],
     ),
     body: Container(
       child: Column( 
         children: <Widget>[
           _swiperTarjetas(context)
         ],
       ),
     ),
    );
  }

  Widget _swiperTarjetas(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return FutureBuilder( 
      future: drinkProvider.getBebidas(),
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