import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/models.dart';
import 'package:lvup_shop/widgets/widgets.dart';

class ItemCarousel extends StatelessWidget {
  final List<Item> items;
  const ItemCarousel({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165.h,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemList(
              item: items[index],
            );
          }),
    );
  }
}
