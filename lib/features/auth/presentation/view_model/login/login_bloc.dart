import 'package:bookit_flutter_project/core/common/snackbar/my_snackbar.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bookit_flutter_project/features/dashboard/presentation/view/bottom_navigation/dashboard_view.dart';
import 'package:bookit_flutter_project/features/dashboard/presentation/view_model/dashboard_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final LoginUseCase _loginUseCase;
  final DashboardCubit _dashboardCubit;

  LoginBloc({
    required RegisterBloc registerBloc,
    required LoginUseCase loginUseCase,
    required DashboardCubit dashboardCubit,
  })  : _registerBloc = registerBloc,
        _loginUseCase = loginUseCase,
        _dashboardCubit = dashboardCubit,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>(_onNavigateRegisterScreenEvent);
    on<NavigateHomeScreenEvent>(_onNavigateHomeScreenEvent);
    on<LoginUserEvent>(_onLoginUserEvent);
  }

  void _onNavigateRegisterScreenEvent(
    NavigateRegisterScreenEvent event,
    Emitter<LoginState> emit,
  ) {
    Navigator.push(
      event.context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _registerBloc,
          child: event.destination,
        ),
      ),
    );
  }

  void _onNavigateHomeScreenEvent(
    NavigateHomeScreenEvent event,
    Emitter<LoginState> emit,
  ) {
    Navigator.pushReplacement(
      event.context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _dashboardCubit,
          child: event.destination,
        ),
      ),
    );
  }

  Future<void> _onLoginUserEvent(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _loginUseCase(
      LoginParams(
        username: event.username,
        password: event.password,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Invalid Credentials",
          color: Colors.red,
        );
      },
      (token) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        add(
          NavigateHomeScreenEvent(
            context: event.context,
            destination: const DashboardView(),
          ),
        );
      },
    );
  }
}
