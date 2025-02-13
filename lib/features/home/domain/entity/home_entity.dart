import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String? bookId;
  final String image;
  final String author;
  final String title;
  final double price;
  final bool hasDiscount;
  final double? discountPercent;

  const HomeEntity({
    this.bookId,
    required this.image,
    required this.author,
    required this.title,
    required this.price,
    required this.hasDiscount,
    this.discountPercent,
  });

  @override
  List<Object?> get props => [
        bookId,
        image,
        author,
        title,
        price,
        hasDiscount,
        discountPercent,
      ];
}
