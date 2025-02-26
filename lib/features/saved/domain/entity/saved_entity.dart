import 'package:equatable/equatable.dart';

class SavedEntity extends Equatable {
  final String favoriteId; // Favorite document ID
  final String bookId; // Book ID
  final String image;
  final String author;
  final String title;
  final double price;
  final String availabilityStatus;

  const SavedEntity({
    required this.favoriteId,
    required this.bookId,
    required this.image,
    required this.author,
    required this.title,
    required this.price,
    required this.availabilityStatus,
  });

  @override
  List<Object?> get props => [
        favoriteId,
        bookId,
        image,
        author,
        title,
        price,
        availabilityStatus,
      ];
}
