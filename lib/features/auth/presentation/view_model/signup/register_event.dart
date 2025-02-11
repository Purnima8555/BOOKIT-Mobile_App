part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

// class LoadCoursesAndBatches extends RegisterEvent {}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final String full_name;
  final String username;
  final String contact_no;
  final String email;
  final String password;
  final String confirmPassword;
  final String? address; // Optional
  final String? image; // Optional
  final BuildContext context;

  const RegisterUser({
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.image,
    required this.context,
  });

  @override
  List<Object> get props => [
        full_name,
        username,
        email,
        contact_no,
        // address,
        // image,
        confirmPassword,
        password,
        context,
      ];
}
