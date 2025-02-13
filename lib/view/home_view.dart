// import 'package:flutter/material.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
          
//           SliverAppBar(
//             expandedHeight: 200,
//             floating: false,
//             pinned: true,
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xFF6A1B9A),
//                     Color(0xFF4527A0),
//                     Color(0xFF1565C0),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: FlexibleSpaceBar(
//                 title: const Text(
//                   'Discover Books',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 background: Stack(
//                   fit: StackFit.expand,
//                   children: [
                    
//                     Positioned(
//                       right: -50,
//                       top: -50,
//                       child: Icon(
//                         Icons.book,
//                         size: 200,
//                         color: Colors.white.withOpacity(0.1),
//                       ),
//                     ),
//                     // Search bar
//                     Positioned(
//                       bottom: 60,
//                       left: 16,
//                       right: 16,
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(25),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 10,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: const TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Search for books...',
//                             prefixIcon: Icon(Icons.search),
//                             border: InputBorder.none,
//                             contentPadding:
//                                 EdgeInsets.symmetric(horizontal: 20),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Featured Books Section with Enhanced Design
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Featured Books',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           foreground: Paint()
//                             ..shader = const LinearGradient(
//                               colors: [Color(0xFF6A1B9A), Color(0xFF1565C0)],
//                             ).createShader(
//                                 const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF6A1B9A),
//                         ),
//                         child: const Text('See All'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 320,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           width: 200,
//                           margin: const EdgeInsets.only(right: 20),
//                           child: Stack(
//                             children: [
//                               // Book Card
//                               Positioned(
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Container(
//                                   height: 160,
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Colors.white,
//                                         Colors.grey.shade100,
//                                       ],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//                                     ),
//                                     borderRadius: BorderRadius.circular(20),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.3),
//                                         spreadRadius: 2,
//                                         blurRadius: 10,
//                                         offset: const Offset(0, 5),
//                                       ),
//                                     ],
//                                   ),
//                                   padding: const EdgeInsets.all(16),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         'Book Title ${index + 1}',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         'Author Name',
//                                         style: TextStyle(
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             '\$${(index + 1) * 10}.99',
//                                             style: const TextStyle(
//                                               color: Color(0xFF6A1B9A),
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(Icons.star,
//                                                   color: Colors.amber,
//                                                   size: 16),
//                                               Text('4.${index + 5}'),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               // Book Cover
//                               Positioned(
//                                 top: 0,
//                                 left: 20,
//                                 right: 20,
//                                 child: Container(
//                                   height: 200,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(16),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.3),
//                                         spreadRadius: 2,
//                                         blurRadius: 15,
//                                         offset: const Offset(0, 8),
//                                       ),
//                                     ],
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(16),
//                                     child: Container(
//                                       color: Color.fromARGB(
//                                           255, index * 30 + 100, 100, 200),
//                                       child: const Center(
//                                         child: Icon(
//                                           Icons.book,
//                                           size: 50,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // New Releases Section
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'New Releases',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           foreground: Paint()
//                             ..shader = const LinearGradient(
//                               colors: [Color(0xFF1565C0), Color(0xFF6A1B9A)],
//                             ).createShader(
//                                 const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF1565C0),
//                         ),
//                         child: const Text('See All'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   SizedBox(
//                     height: 180,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           width: 320,
//                           margin: const EdgeInsets.only(right: 20),
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.white, Colors.grey.shade50],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.2),
//                                 spreadRadius: 1,
//                                 blurRadius: 8,
//                                 offset: const Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 120,
//                                 margin: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: const Offset(0, 4),
//                                     ),
//                                   ],
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(12),
//                                   child: Container(
//                                     color: Color.fromARGB(
//                                         255, 200, index * 30 + 100, 100),
//                                     child: const Center(
//                                       child: Icon(
//                                         Icons.book,
//                                         size: 40,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         'New Book ${index + 1}',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(
//                                         'Author Name',
//                                         style: TextStyle(
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             '\$${(index + 1) * 12}.99',
//                                             style: const TextStyle(
//                                               color: Color(0xFF1565C0),
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           const Spacer(),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 6,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xFF1565C0),
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                             child: const Text(
//                                               'Buy Now',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Bestsellers Section
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Bestsellers',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           foreground: Paint()
//                             ..shader = const LinearGradient(
//                               colors: [Color(0xFF4527A0), Color(0xFF1565C0)],
//                             ).createShader(
//                                 const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         style: TextButton.styleFrom(
//                           foregroundColor: const Color(0xFF4527A0),
//                         ),
//                         child: const Text('See All'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.65,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                     ),
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 1,
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               flex: 3,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.vertical(
//                                     top: Radius.circular(16),
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.2),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: const Offset(0, 4),
//                                     ),
//                                   ],
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(
//                                     top: Radius.circular(16),
//                                   ),
//                                   child: Container(
//                                     color: Color.fromARGB(
//                                         255, 100, index * 30 + 100, 200),
//                                     child: const Center(
//                                       child: Icon(
//                                         Icons.book,
//                                         size: 40,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Bestseller ${index + 1}',
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                         const SizedBox(height: 4),
//                                         Text(
//                                           'Author Name',
//                                           style: TextStyle(
//                                             color: Colors.grey[600],
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           '\$${(index + 1) * 15}.99',
//                                           style: const TextStyle(
//                                             color: Color(0xFF4527A0),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(6),
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xFF4527A0),
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                           child: const Icon(
//                                             Icons.add_shopping_cart,
//                                             color: Colors.white,
//                                             size: 20,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Bottom Padding
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 80),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         icon: const Icon(Icons.shopping_cart),
//         label: const Text('Cart'),
//         backgroundColor: const Color(0xFF6A1B9A),
//       ),
//     );
//   }
// }
