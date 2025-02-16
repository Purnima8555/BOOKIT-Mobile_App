import 'package:bloc/bloc.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:bookit_flutter_project/features/explore/domain/usecase/get_all_books_usecase.dart';
import 'package:bookit_flutter_project/features/explore/domain/usecase/get_books_by_genre_usecase.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetAllExploreBooksUsecase _getAllBooksUsecase;
  final GetBooksByGenreUsecase _getBooksByGenreUsecase;

  ExploreBloc({
    required GetAllExploreBooksUsecase getAllBooksUsecase,
    required GetBooksByGenreUsecase getBooksByGenreUsecase,
  })  : _getAllBooksUsecase = getAllBooksUsecase,
        _getBooksByGenreUsecase = getBooksByGenreUsecase,
        super(ExploreState.initial()) {
    on<LoadAllBooksEvent>(_onLoadAllBooks);
    on<LoadBooksByGenreEvent>(_onLoadBooksByGenre);

    // Optionally, you can dispatch events here to load data initially
    // add(LoadAllBooksEvent());
    // add(LoadBooksByGenreEvent(genre: 'All'));
  }

  Future<void> _onLoadAllBooks(
    LoadAllBooksEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllBooksUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (books) => emit(state.copyWith(
          isLoading: false, books: books)), // Correctly updates books
    );
  }

  Future<void> _onLoadBooksByGenre(
    LoadBooksByGenreEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getBooksByGenreUsecase.call(event.genre);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (books) => emit(state.copyWith(
          isLoading: false,
          booksByGenre: books)), // Updates booksByGenre instead of books
    );
  }
}
