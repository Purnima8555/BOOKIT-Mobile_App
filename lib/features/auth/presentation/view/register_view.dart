import 'package:bookit_flutter_project/features/auth/presentation/view/login_view.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 17);
  final _key = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _obscureTextPassword =
      ValueNotifier<bool>(true);
  final _obscureTextConfirmPassword =
      ValueNotifier<bool>(true);

  InputDecoration _inputDecoration(String label, IconData icon,
      {Widget? suffixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFF043155),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      labelText: label,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black54,
      ),
      prefixIcon: Icon(
        icon,
        size: 22.0,
        color: Colors.black,
      ),
      suffixIcon:
          suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Brand Bold',
                          color: Color(0xFF1E2751),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Upload image from camera (optional)
                                },
                                icon: const Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Camera',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Gallery',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const SizedBox(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap to upload your profile picture',
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Full name
                  TextFormField(
                    controller: _fullNameController,
                    decoration: _inputDecoration('Full Name', Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  _gap,

                  // Username
                  TextFormField(
                    controller: _usernameController,
                    decoration: _inputDecoration('Username', Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                  ),
                  _gap,

                  // Phone No
                  TextFormField(
                    controller: _phoneController,
                    decoration: _inputDecoration('Phone No', Icons.phone),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                  ),
                  _gap,

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration('Email', Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  _gap,

                  // Password Field
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscureTextPassword,
                    builder: (context, obscureText, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: obscureText,
                        decoration: _inputDecoration(
                          'Password',
                          Icons.lock,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _obscureTextPassword.value =
                                  !_obscureTextPassword.value;
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  _gap,

                  // Confirm Password Field
                  ValueListenableBuilder<bool>(
                    valueListenable: _obscureTextConfirmPassword,
                    builder: (context, obscureText, child) {
                      return TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: obscureText,
                        decoration: _inputDecoration(
                          'Confirm Password',
                          Icons.lock_outline,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _obscureTextConfirmPassword.value =
                                  !_obscureTextConfirmPassword.value;
                            },
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  _gap,

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E2751),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          context.read<RegisterBloc>().add(
                                RegisterUser(
                                  context: context,
                                  full_name: _fullNameController.text,
                                  username: _usernameController.text,
                                  contact_no: _phoneController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                  image: null, // Add image handling logic here
                                ),
                              );
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        child: const Text(
                          " SignIn",
                          style: TextStyle(
                            color: Color(0xFF043155),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
