part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final bool isLoading;
  final List<SavedEntity> savedBooks;
  final String error;

  const SavedState({
    required this.isLoading,
    required this.savedBooks,
    required this.error,
  });

  factory SavedState.initial() {
    return const SavedState(
      isLoading: false,
      savedBooks: [],
      error: '',
    );
  }

  SavedState copyWith({
    bool? isLoading,
    List<SavedEntity>? savedBooks,
    String? error,
  }) {
    return SavedState(
      isLoading: isLoading ?? this.isLoading,
      savedBooks: savedBooks ?? this.savedBooks,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, savedBooks, error];
}
