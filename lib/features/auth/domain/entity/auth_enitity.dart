import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String full_name;
  final String username;
  final String contact_no;
  final String email;
  final String password;
  final String confirmPassword;
  final String? address; // Optional address field
  final String? image; // Optional image field

  const AuthEntity({
    this.userId,
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.image,
  });

  @override
  List<Object?> get props => [
        userId,
        full_name,
        username,
        contact_no,
        email,
        password,
        confirmPassword,
        address,
        image
      ];
}
