part of 'explore_bloc.dart';

class ExploreState extends Equatable {
  final bool isLoading;
  final List<ExploreEntity> books; // For getAllBooks
  final List<ExploreEntity> booksByGenre; // For getBooksByGenre
  final String error;

  const ExploreState({
    required this.isLoading,
    required this.books,
    required this.booksByGenre,
    required this.error,
  });

  factory ExploreState.initial() {
    return const ExploreState(
      isLoading: false,
      books: [],
      booksByGenre: [],
      error: '',
    );
  }

  ExploreState copyWith({
    bool? isLoading,
    List<ExploreEntity>? books,
    List<ExploreEntity>? booksByGenre,
    String? error,
  }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
      booksByGenre: booksByGenre ?? this.booksByGenre,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, books, booksByGenre, error];
}
