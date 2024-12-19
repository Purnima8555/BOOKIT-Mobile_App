import 'package:bookit_flutter_project/view/explore_view.dart';
import 'package:bookit_flutter_project/view/home_view.dart';
import 'package:bookit_flutter_project/view/profile_view.dart';
import 'package:bookit_flutter_project/view/saved_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ExploreView(),
    const SavedView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1E2751),
        title: Row(
          children: [
            // ConstrainedBox to scale image properly
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 70,
              ),
              child: Image.asset(
                'assets/images/logo_nobg.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 3),
            const Text(
              'BOOKIT!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0),
             // Hamburger icon
            child: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 27,
              onPressed: () {
                // menu functionality here
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1E2751),
        unselectedItemColor:
            Colors.grey[700],
        iconSize: 27,
        selectedFontSize: 13,
        unselectedFontSize: 12,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // cart functionality here
        },
        backgroundColor: const Color(0xFF1E2751),
        child: const Icon(
          Icons.shopping_cart,
          size: 25,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat,
    );
  }
}
