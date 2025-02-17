part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool isLoading;
  final AuthEntity? user;
  final String error;

  const UserState({
    required this.isLoading,
    this.user,
    required this.error,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      user: null,
      error: '',
    );
  }

  UserState copyWith({
    bool? isLoading,
    AuthEntity? user,
    String? error,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, user, error];
}
