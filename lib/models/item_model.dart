import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final String detail;
  final bool isRecommended;
  final bool isPopular;

  const Item(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.detail,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        detail,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Item> items = [
    Item(
        name: 'Title1',
        category: 'sword',
        imageUrl:
            'https://static.wikia.nocookie.net/dota2_gamepedia/images/a/aa/Cosmetic_icon_Vigil_Triumph.png/revision/latest?cb=20171125195229',
        detail:
            "1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        price: 1000,
        isPopular: false,
        isRecommended: false),
    Item(
        name: 'Title2',
        category: 'potion',
        imageUrl:
            'https://www.nicepng.com/png/detail/152-1527956_potion-of-deaths-postponement-dnd-magic-item-art.png',
        detail:
            "2bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
        price: 50,
        isPopular: true,
        isRecommended: true),
    Item(
        name: 'Title3',
        category: 'material',
        imageUrl:
            'https://i.pinimg.com/564x/3e/d3/83/3ed383ef4036f80f424f28b410080667.jpg',
        detail:
            "3ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc",
        price: 20,
        isPopular: false,
        isRecommended: true),
    Item(
        name: 'Title4',
        category: 'fashion',
        imageUrl:
            'http://exp.co.th/content_images/images/Online-MMO/12%20Tails/News/070654/Penguin_noCostume2copy.jpg',
        detail:
            "4dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
        price: 10000,
        isPopular: true,
        isRecommended: false),
  ];
}
