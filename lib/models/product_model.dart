import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final bool isRecommended;
  final bool isPopular;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        isPopular,
        isRecommended,
      ];

  static List<Product> products = [
    Product(
        name: 'Tower of fantasy',
        category: 'game',
        imageUrl:
            'https://play-lh.googleusercontent.com/wPYYeEooM8vxYp_j4dS5qDdhTzOX4Kq787SqWd_3NRLPCqpRKP50ABpx-0ikn8fsAw',
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Genshin impact',
        category: 'game',
        imageUrl:
            'https://img.captain-droid.com/wp-content/uploads/com-mihoyo-genshinimpact-icon.png',
        isPopular: true,
        isRecommended: true),
    Product(
        name: '12Tails',
        category: 'game',
        imageUrl:
            'https://stickershop.line-scdn.net/stickershop/v1/sticker/5062972/android/sticker.png;compress=true',
        isPopular: false,
        isRecommended: false),
    Product(
        name: 'LOL',
        category: 'game',
        imageUrl:
            'https://cdnb.artstation.com/p/assets/images/images/021/422/255/medium/t-j-geisen-lol-icon-rendered-v001.jpg?1571640551',
        isPopular: true,
        isRecommended: false),
    Product(
        name: 'Ragnarok',
        category: 'game',
        imageUrl:
            'https://siamboardgames.com/wp-content/uploads/2021/11/Ragnarok-Monster-Card-Collector.png',
        isPopular: true,
        isRecommended: true),
  ];
}
