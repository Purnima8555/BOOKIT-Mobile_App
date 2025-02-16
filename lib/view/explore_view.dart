// import 'package:flutter/material.dart';

// class ExploreView extends StatefulWidget {
//   const ExploreView({Key? key}) : super(key: key);

//   @override
//   _ExploreViewState createState() => _ExploreViewState();
// }

// class _ExploreViewState extends State<ExploreView> {
//   String selectedGenre = 'All';

//   final List<Map<String, dynamic>> genres = [
//     {'name': 'All', 'icon': Icons.apps, 'color': const Color(0xFF6A1B9A)},
//     {
//       'name': 'Educational',
//       'img': 'assets/category_icons/education.png',
//     },
//     {
//       'name': 'Business',
//       'img': 'assets/category_icons/business.png',
//     },
//     {
//       'name': 'Art & Photography',
//       'img': 'assets/category_icons/art_photography.png',
//     },
//     {'name': 'Drama', 'img': 'assets/category_icons/drama.png'},
//     {
//       'name': 'Fantasy',
//       'img': 'assets/category_icons/fantasy.png',
//     },
//     {'name': 'Science', 'img': 'assets/category_icons/scifi.png'},
//     {'name': 'Horror', 'img': 'assets/category_icons/horror.png'},
//     {
//       'name': 'Romance',
//       'img': 'assets/category_icons/romance.png',
//     },
//     {
//       'name': 'Mystery',
//       'img': 'assets/category_icons/mystery.png',
//     },
//     {
//       'name': 'Biography',
//       'img': 'assets/category_icons/biography.png',
//     },
//     {
//       'name': 'Children',
//       'img': 'assets/category_icons/children.png',
//     },
//     {
//       'name': 'Self-help',
//       'img': 'assets/category_icons/selfhelp.png',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color(0xFFF5F5F5), // Set the background color to whitesmoke
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1E2751),
//         elevation: 0,
//         title: const Text(
//           'Explore Books',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Placeholder for search functionality
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         color: const Color(
//             0xFFF5F5F5), // Set the background color of CustomScrollView to whitesmoke
//         child: CustomScrollView(
//           slivers: [
//             // Genre Categories
//             SliverToBoxAdapter(
//               child: Container(
//                 height: 155,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: genres.length,
//                   itemBuilder: (context, index) {
//                     final genre = genres[index];
//                     final isSelected = selectedGenre == genre['name'];
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedGenre = genre['name'];
//                         });
//                       },
//                       child: Container(
//                         width: 115,
//                         margin: const EdgeInsets.only(right: 16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                           border: isSelected
//                               ? Border.all(color: Colors.grey, width: 2)
//                               : null,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             if (genre['name'] == 'All')
//                               Icon(
//                                 genre['icon'],
//                                 color: const Color(0xFF1E2751),
//                                 size: 48,
//                               )
//                             else
//                               Image.asset(
//                                 genre['img'],
//                                 width: 48,
//                                 height: 48,
//                               ),
//                             const SizedBox(height: 8),
//                             Text(
//                               genre['name'],
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                               textAlign:
//                                   TextAlign.center, // Center-align the text
//                             ),
//                             if (isSelected)
//                               Container(
//                                 margin: const EdgeInsets.only(top: 8),
//                                 width: 40,
//                                 height: 4,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.circular(2),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),

//             // Books Grid
//             SliverPadding(
//               padding: const EdgeInsets.all(16),
//               sliver: SliverGrid(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.65,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                 ),
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Book Cover
//                           Expanded(
//                             flex: 5,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(20),
//                                 ),
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.purple[900]!,
//                                     Colors.blue[900]!,
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                               ),
//                               child: Center(
//                                 child: Icon(
//                                   Icons.book,
//                                   size: 50,
//                                   color: Colors.white.withOpacity(0.5),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // Book Info
//                           Expanded(
//                             flex: 3,
//                             child: Padding(
//                               padding: const EdgeInsets.all(12),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Book Title ${index + 1}',
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         'Author Name',
//                                         style: TextStyle(
//                                           color: Colors.grey[600],
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     'Rs ${(index + 1) * 10}.99',
//                                     style: const TextStyle(
//                                       color: Color(0xFF6A1B9A),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   childCount: 10,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
