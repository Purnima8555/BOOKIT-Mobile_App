// import 'package:flutter/material.dart';

// class AuthTextFormFields extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final IconData icon;
//   final bool obscureText;
//   final ValueNotifier<bool>? obscureTextNotifier;
//   final FormFieldValidator<String>? validator;

//   const AuthTextFormFields({
//     Key? key,
//     required this.controller,
//     required this.label,
//     required this.icon,
//     this.obscureText = false,
//     this.obscureTextNotifier,
//     this.validator,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureTextNotifier != null
//             ? obscureTextNotifier!.value
//             : obscureText,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.grey),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Color(0xFF043155),
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           labelText: label,
//           labelStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.black54,
//           ),
//           prefixIcon: Icon(
//             icon,
//             size: 22.0,
//             color: Colors.black,
//           ),
//           suffixIcon: obscureTextNotifier != null
//               ? GestureDetector(
//                   onTap: () {
//                     obscureTextNotifier!.value = !obscureTextNotifier!.value;
//                   },
//                   child: Icon(
//                     obscureTextNotifier!.value
//                         ? Icons.visibility_off
//                         : Icons.visibility,
//                     size: 20.0,
//                     color: Colors.black,
//                   ),
//                 )
//               : null,
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }
