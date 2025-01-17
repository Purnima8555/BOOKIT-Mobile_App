import 'package:bookit_flutter_project/features/auth/presentation/view/register_view.dart';
import 'package:bookit_flutter_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _obscureTextPassword =
      ValueNotifier<bool>(true); // Password visibility toggle
  final _gap = const SizedBox(height: 17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 38, // Increased font size
                        fontWeight: FontWeight.bold, // Increased font weight
                        fontFamily: 'Brand Bold',
                        color: Color(0xFF1E2751),
                      ),
                    ),
                    _gap,
                    // Username field with updated label style
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        key: const ValueKey('username'),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded corners
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF043155), // Custom focus color
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Username',
                          labelStyle: const TextStyle(
                            fontWeight:
                                FontWeight.bold, // Increased font weight
                            fontSize: 16, // Slightly larger font size
                            color: Colors.black54, // Default label color
                          ),
                          prefixIcon: const Icon(
                            Icons.person, // User icon
                            size: 22.0,
                            color: Colors.black,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                    ),
                    _gap,
                    // Password field with updated label style
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _obscureTextPassword,
                        builder: (context, obscureText, child) {
                          return TextFormField(
                            key: const ValueKey('password'),
                            controller: _passwordController,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Rounded corners
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:
                                      Color(0xFF043155), // Custom focus color
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Increased font weight
                                fontSize: 16, // Slightly larger font size
                                color: Colors.black54, // Default label color
                              ),
                              prefixIcon: const Icon(
                                Icons.lock, // Lock icon
                                size: 22.0,
                                color: Colors.black,
                              ),
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
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            }),
                          );
                        },
                      ),
                    ),
                    _gap,

                    // Forgot Password?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle forgot password action here
                            print("Forgot Password tapped");
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 8.0), // Added space
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14, // Increased font size
                                fontWeight: FontWeight.w500, // Increased weight
                                color: Color(0xFF043155),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Login Button with updated width
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        width: double.infinity, // Full width within the padding
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // Rounded corners
                            ),
                            backgroundColor: const Color(0xFF1E2751),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15), // Button color
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(
                                    LoginUserEvent(
                                      context: context,
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20, // Increased font size
                              fontWeight: FontWeight.normal, // Increased weight
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // New Sign-up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterView(),
                              ),
                            );
                          },
                          child: const Text(
                            " SignUp",
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
      ),
    );
  }
}
