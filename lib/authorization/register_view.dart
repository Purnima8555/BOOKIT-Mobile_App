import 'package:bookit_flutter_project/authorization/login_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscureTextPassword = ValueNotifier(true);
  final ValueNotifier<bool> _obscureTextConfirmPassword = ValueNotifier(true);

  RegisterView({Key? key}) : super(key: key);

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
                const SizedBox(height: 15),

                // Title text (Sign Up)
                const Text(
                  "SignUp",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color(0xFF1E2751),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                // Full Name field
                TextFormField(
                  controller: _nameController,
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
                      Icons.person,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    hintText: 'Full Name',
                    hintStyle: const TextStyle(
                        fontFamily: 'WorkSansSemiBold', fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 17),

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

                // Contact Number field
                TextFormField(
                  controller: _contactNoController,
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
                      Icons.phone,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    hintText: 'Contact Number',
                    hintStyle: const TextStyle(
                        fontFamily: 'WorkSansSemiBold', fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 17),

                // Email field
                TextFormField(
                  controller: _emailController,
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
                      Icons.email,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    hintText: 'Email',
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

                // Confirm Password field
                ValueListenableBuilder<bool>(
                  valueListenable: _obscureTextConfirmPassword,
                  builder: (context, obscureText, child) {
                    return TextFormField(
                      obscureText: obscureText,
                      controller: _confirmPasswordController,
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
                        hintText: 'Confirm Password',
                        hintStyle: const TextStyle(
                            fontFamily: 'WorkSansSemiBold', fontSize: 15.0),
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
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Register button
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
                    onPressed: () {
                      // Add registration logic
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Log in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to the LoginView page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: const Text(
                        "SignIn",
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
