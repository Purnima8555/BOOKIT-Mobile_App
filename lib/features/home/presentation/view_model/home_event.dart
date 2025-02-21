part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadAllBooksEvent extends HomeEvent {}

class LoadNewBooksEvent extends HomeEvent {}

class LoadBestBooksEvent extends HomeEvent {}
