part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<HomeEntity> books; // For getAllBooks
  final List<HomeEntity> newBooks; // For getNewBooks
  final List<HomeEntity> bestBooks; // For getBestBooks
  final String error;

  const HomeState({
    required this.isLoading,
    required this.books,
    required this.newBooks,
    required this.bestBooks,
    required this.error,
  });

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      books: [],
      newBooks: [],
      bestBooks: [],
      error: '',
    );
  }

  HomeState copyWith({
    bool? isLoading,
    List<HomeEntity>? books,
    List<HomeEntity>? newBooks,
    List<HomeEntity>? bestBooks,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
      newBooks: newBooks ?? this.newBooks,
      bestBooks: bestBooks ?? this.bestBooks,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, books, newBooks, bestBooks, error];
}
