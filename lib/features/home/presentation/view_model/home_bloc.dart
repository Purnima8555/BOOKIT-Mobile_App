import 'package:bloc/bloc.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:bookit_flutter_project/features/home/domain/usecase/get_all_books_usecase.dart';
import 'package:bookit_flutter_project/features/home/domain/usecase/get_best_books_usecase.dart';
import 'package:bookit_flutter_project/features/home/domain/usecase/get_new_books_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllBooksUsecase _getAllBooksUsecase;
  final GetNewBooksUsecase _getNewBooksUsecase;
  final GetBestBooksUsecase _getBestBooksUsecase;

  HomeBloc({
    required GetAllBooksUsecase getAllBooksUsecase,
    required GetNewBooksUsecase getNewBooksUsecase,
    required GetBestBooksUsecase getBestBooksUsecase,
  })  : _getAllBooksUsecase = getAllBooksUsecase,
        _getNewBooksUsecase = getNewBooksUsecase,
        _getBestBooksUsecase = getBestBooksUsecase,
        super(HomeState.initial()) {
    on<LoadAllBooksEvent>(_onLoadAllBooks);
    on<LoadNewBooksEvent>(_onLoadNewBooks);
    on<LoadBestBooksEvent>(_onLoadBestBooks);

    // add(LoadAllBooksEvent());
    // add(LoadNewBooksEvent());
    // add(LoadBestBooksEvent());
  }

  Future<void> _onLoadAllBooks(
    LoadAllBooksEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllBooksUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (books) => emit(state.copyWith(
          isLoading: false, books: books)), // ✅ Correctly updates books
    );
  }

  Future<void> _onLoadNewBooks(
    LoadNewBooksEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getNewBooksUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (newBooks) => emit(state.copyWith(
          isLoading: false,
          newBooks: newBooks)), // ✅ Updates newBooks instead of books
    );
  }

  Future<void> _onLoadBestBooks(
    LoadBestBooksEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getBestBooksUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (bestBooks) => emit(state.copyWith(
          isLoading: false,
          bestBooks: bestBooks)), // ✅ Updates bestBooks instead of books
    );
  }
}
