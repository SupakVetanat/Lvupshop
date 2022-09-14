import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/models.dart';
import 'package:lvup_shop/widgets/widgets.dart';


class GameCarousel extends StatelessWidget {
  final List<Product> products;

  const GameCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GameList(
              product: products[index],
            );
          }),
    );
  }
}
