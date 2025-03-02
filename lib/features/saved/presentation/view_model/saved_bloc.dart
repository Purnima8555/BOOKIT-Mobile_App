import 'package:bloc/bloc.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:bookit_flutter_project/features/saved/domain/use_case/add_saved_books_usecase.dart';
import 'package:bookit_flutter_project/features/saved/domain/use_case/get_saved_books_use_case.dart';
import 'package:bookit_flutter_project/features/saved/domain/use_case/remove_saved_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetSavedBooksUseCase _getSavedBooksUseCase;
  final AddSavedBookUseCase _addSavedBookUseCase;
  final RemoveSavedBookUseCase _removeSavedBookUseCase;

  SavedBloc({
    required GetSavedBooksUseCase getSavedBooksUseCase,
    required AddSavedBookUseCase addSavedBookUseCase,
    required RemoveSavedBookUseCase removeSavedBookUseCase,
  })  : _getSavedBooksUseCase = getSavedBooksUseCase,
        _addSavedBookUseCase = addSavedBookUseCase,
        _removeSavedBookUseCase = removeSavedBookUseCase,
        super(SavedState.initial()) {
    on<LoadSavedBooksEvent>(_onLoadSavedBooks);
    on<AddSavedBookEvent>(_onAddSavedBook);
    on<RemoveSavedBookEvent>(_onRemoveSavedBook);

    // Load saved books on init
    add(LoadSavedBooksEvent());
  }

  Future<void> _onLoadSavedBooks(
      LoadSavedBooksEvent event, Emitter<SavedState> emit) async {
    emit(state.copyWith(isLoading: true));
    final userId = await _getUserId();
    if (userId == null) {
      emit(state.copyWith(isLoading: false, error: 'User not logged in'));
      return;
    }
    final result = await _getSavedBooksUseCase(userId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (savedBooks) =>
          emit(state.copyWith(isLoading: false, savedBooks: savedBooks)),
    );
  }

  Future<void> _onAddSavedBook(
      AddSavedBookEvent event, Emitter<SavedState> emit) async {
    emit(state.copyWith(isLoading: true));
    final userId = await _getUserId();
    if (userId == null) {
      emit(state.copyWith(isLoading: false, error: 'User not logged in'));
      return;
    }
    final result = await _addSavedBookUseCase(
        AddSavedBookParams(userId: userId, bookId: event.bookId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => add(LoadSavedBooksEvent()), // Refresh list
    );
  }

  Future<void> _onRemoveSavedBook(
      RemoveSavedBookEvent event, Emitter<SavedState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _removeSavedBookUseCase(event.favoriteId);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => add(LoadSavedBooksEvent()), // Refresh list
    );
  }

  Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }
}
