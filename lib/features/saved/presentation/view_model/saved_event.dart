part of 'saved_bloc.dart';

sealed class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object?> get props => [];
}

class LoadSavedBooksEvent extends SavedEvent {}

class AddSavedBookEvent extends SavedEvent {
  final String bookId;

  const AddSavedBookEvent({required this.bookId});

  @override
  List<Object?> get props => [bookId];
}

class RemoveSavedBookEvent extends SavedEvent {
  final String favoriteId;

  const RemoveSavedBookEvent({required this.favoriteId});

  @override
  List<Object?> get props => [favoriteId];
}
