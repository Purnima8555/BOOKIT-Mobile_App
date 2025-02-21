part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class LoadAllBooksEvent extends ExploreEvent {}

class LoadBooksByGenreEvent extends ExploreEvent {
  final String genre;

  const LoadBooksByGenreEvent({required this.genre});

  @override
  List<Object> get props => [genre];
}
