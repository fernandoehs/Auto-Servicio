import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
    final imageList = [
    'https://res.cloudinary.com/dejdesqul/image/upload/v1612131317/autos/kia-rio.jpg',
    'https://res.cloudinary.com/dejdesqul/image/upload/v1612131315/autos/tiida.jpg',
    'https://res.cloudinary.com/dejdesqul/image/upload/v1612131496/autos/chevrolet-sail.jpg',
    'https://res.cloudinary.com/dejdesqul/image/upload/v1612131881/autos/Kia-Sportage.jpg',
    'https://res.cloudinary.com/dejdesqul/image/upload/v1612131884/autos/Versa.png',
  ];

  final List<dynamic> autos;

  CardSwiper({@required this.autos});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top:10.0),
      
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.8,
          itemHeight: _screenSize.height  * 0.3,
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
            borderRadius: BorderRadius.circular(20.0) , 
            child: Image.network(
            imageList[index],
            fit: BoxFit.fill,
            ),
            );

        },
        itemCount: 5,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
        ),
      
    );
  }
}