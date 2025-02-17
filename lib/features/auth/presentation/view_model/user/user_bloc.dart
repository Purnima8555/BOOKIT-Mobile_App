import 'package:bloc/bloc.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/get_user_use_case.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUsecase _getCurrentUserUsecase;

  UserBloc({required GetCurrentUserUsecase getCurrentUserUsecase})
      : _getCurrentUserUsecase = getCurrentUserUsecase,
        super(UserState.initial()) {
    on<LoadUser>(_onLoadUser);
  }

  Future<void> _onLoadUser(
    LoadUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getCurrentUserUsecase();
    result.fold(
      (failure) {
        print('Failed to get current user: ${failure.message}');
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (user) {
        print('User fetched successfully: $user');
        emit(state.copyWith(isLoading: false, user: user));
      },
    );
  }
}
