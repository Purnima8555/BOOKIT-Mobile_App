import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bookit_flutter_project/core/common/snackbar/my_snackbar.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({required RegisterUseCase registerUseCase})
      : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterUser>(_onRegisterUserEvent);
  }

  void _onRegisterUserEvent(
    RegisterUser event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUseCase.call(RegisterUserParams(
      full_name: event.full_name, // Ensure this matches the constructor fields
      username: event.username,
      contact_no: event.contact_no,
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
      address: event.address,
      image: event.image,
    ));

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
            context: event.context,
            message: "Registration Failed. Please try again.");
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }
}
