import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:restaurante/src/models/platillos_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Producto> productos;
  CardSwiper({
    @required this.productos
  });
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.orange,
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
         itemWidth:_screenSize.width * 0.8,
         itemHeight: _screenSize.height * 0.876,
          itemBuilder: (BuildContext context,int index){

            productos[index].uniqueId = '${productos[index].nombre}-tarjeta';
            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: (){
                      Navigator.pushNamed(context, 'Detalle', arguments: productos[index]); 
                  },
                  child: FadeInImage(
                    image: NetworkImage(productos[index].getPosterImg()),
                    placeholder: AssetImage('assets/loading.gif'),
                    fit: BoxFit.cover
                  ),
                )
              );
          },
          itemCount: productos.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
        ),
    );
  }
}