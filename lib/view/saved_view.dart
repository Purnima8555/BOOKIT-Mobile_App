// import 'package:flutter/material.dart';

// class SavedView extends StatelessWidget {
//   final List<Map<String, String>> savedBooks = [
//     {
//       "title": "The Great Gatsby",
//       "author": "F. Scott Fitzgerald",
//       "image": 'assets/images/thegreatgatsby.jpg',
//     },
//     {
//       "title": "The Catcher in the Rye",
//       "author": "George Orwell",
//       "image": 'assets/images/thecatcherintherye.jpg',
//     },
//     {
//       "title": "To Kill a Mockingbird",
//       "author": "Harper Lee",
//       "image": 'assets/images/tokillamockingbird.jpg',
//     },
//   ];

//   SavedView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             // Custom App Bar
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Saved Books',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 0.5,
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.search, size: 28),
//                           onPressed: () {
//                             // Implement search functionality
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       '${savedBooks.length} books saved',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Books List
//             SliverPadding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               sliver: SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     final book = savedBooks[index];
//                     return Dismissible(
//                       key: Key(book["title"]!),
//                       background: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 8.0),
//                         decoration: BoxDecoration(
//                           color: Colors.red[400],
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         alignment: Alignment.centerRight,
//                         padding: const EdgeInsets.only(right: 20),
//                         child: const Icon(
//                           Icons.delete_outline,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                       direction: DismissDirection.endToStart,
//                       onDismissed: (direction) {
//                         // Handle book removal
//                         print('Removing ${book["title"]}');
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 8.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.1),
//                               spreadRadius: 1,
//                               blurRadius: 10,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               onTap: () {
//                                 // Handle book selection
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Row(
//                                   children: [
//                                     // Book Cover
//                                     Hero(
//                                       tag: book["title"]!,
//                                       child: Container(
//                                         width: 80,
//                                         height: 120,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           image: DecorationImage(
//                                             image: AssetImage(book["image"]!),
//                                             fit: BoxFit.cover,
//                                           ),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color:
//                                                   Colors.black.withOpacity(0.2),
//                                               spreadRadius: 1,
//                                               blurRadius: 5,
//                                               offset: const Offset(0, 2),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 16),

//                                     // Book Details
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             book["title"]!,
//                                             style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                               letterSpacing: 0.5,
//                                             ),
//                                           ),
//                                           const SizedBox(height: 8),
//                                           Text(
//                                             book["author"]!,
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                           const SizedBox(height: 12),
//                                           Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.bookmark,
//                                                 size: 20,
//                                                 color: Colors.blue[400],
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Text(
//                                                 'Saved',
//                                                 style: TextStyle(
//                                                   color: Colors.blue[400],
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   childCount: savedBooks.length,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
