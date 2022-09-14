import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lvup_shop/models/models.dart';
import 'package:lvup_shop/widgets/section_title_item.dart';
import 'package:lvup_shop/widgets/widgets.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<String> images = [
    'https://www.toweroffantasy-global.com/images/tower-of-fantasy.jpg',
    'https://i.pinimg.com/originals/7d/2c/cd/7d2ccdbb4c9ee2f3a1f4e92f8d380486.jpg',
    'https://cdn.tigthai.com/imguploads/202206/20/0062545001655711374951_overwatch_main.jpg',
    'https://images.droidsans.com/wp-content/uploads/2019/05/League-of-Legends-1000x600.jpg',
    'https://s.isanook.com/ga/0/rp/r/w728/ya0xa0m1w0/aHR0cHM6Ly9zLmlzYW5vb2suY29tL2dhLzAvdWQvMjE5LzEwOTg0NDEvMTJ0YWlscy0xMi5qcGc=.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0XFFF9F9F9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Recommend",
                    style: TextStyle(
                      color: Color(0xFF242F40),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), //Reccommend

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index % images.length;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Image.network(
                          images[index % images.length],
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  ), //PageView.builder
                ), //banner

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < images.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ), //วงบอกภาพ

                // Container(
                //   padding: EdgeInsets.only(left: 30),
                //   child: Text(
                //     "Game",
                //     style: TextStyle(
                //       color: Color(0xFF242F40),
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ), //game

                SectionTitle(
                  title: 'Game ',
                ),
                GameCarousel(products: Product.products
                    // .where((product) => product.isRecommended)
                    // .toList()
                    ),

                SectiontitleItem(title: 'Lastest'),
                ItemCarousel(items: Item.items
                    // .where((product) => product.isRecommended)
                    // .toList()
                    ),
              ],
            ), //Column
          ),
          //--------ส่วนบน----------//
        ),
      ), //SingleChildScrollView
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: isSelected ? 10 : 5,
        width: isSelected ? 10 : 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ), //BoxDecoration
      ),
    ); //Container
  }
}
