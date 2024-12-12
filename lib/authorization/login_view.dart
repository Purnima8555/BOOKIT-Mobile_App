import 'package:bookit_flutter_project/authorization/register_view.dart';
import 'package:bookit_flutter_project/view/dashboard_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscureTextPassword = ValueNotifier(true);

  LoginView({Key? key}) : super(key: key);

  void _login(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Username and password validation
    if (username == "admin" && password == "admin") {
      // Navigate to the DashboardView on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardView()),
      );
    } else {
      // Show error message if credentials don't match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // CircleAvatar with border
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 4.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 20),

                // Title text
                const Text(
                  "SignIn",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF1E2751),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Username field
                TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(
                    fontFamily: 'WorkSansSemiBold',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 19),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    hintText: 'Username',
                    hintStyle: const TextStyle(
                        fontFamily: 'WorkSansSemiBold', fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 17),

                // Password field
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureTextPassword,
                  builder: (context, obscureText, child) {
                    return TextFormField(
                      obscureText: obscureText,
                      controller: _passwordController,
                      style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 19),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 22.0,
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            fontFamily: 'WorkSansSemiBold', fontSize: 15.0),
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
                    );
                  },
                ),
                const SizedBox(height: 17),

                // Forgot Password?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle forgot password action here
                        print("Forgot Password tapped");
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 4, 49, 85),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF1E2751),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Color(0xFF1E2751)),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    onPressed: () => _login(context),
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Sign up link
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
                              builder: (context) =>
                                  RegisterView()), // Navigate to RegisterView
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 49, 85),
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
    );
  }
}
