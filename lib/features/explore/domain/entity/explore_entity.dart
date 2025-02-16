import 'package:equatable/equatable.dart';

class ExploreEntity extends Equatable {
  final String? bookId;
  final String image;
  final String author;
  final String title;
  final double price;

  const ExploreEntity({
    this.bookId,
    required this.image,
    required this.author,
    required this.title,
    required this.price,
  });

  @override
  List<Object?> get props => [
        bookId,
        image,
        author,
        title,
        price,
      ];
}
