import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final String userName = 'Riyaa1';
  final String userEmail = 'r1@gmail.com';

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              _buildProfileSection(),

              // Account Settings
              _buildAccountSettings(),

              // Your Activities
              const SizedBox(height: 20),
              const Text(
                'Your Activities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),

              // Sections (Purchased Books, Active Rentals)
              _buildTabSection(context),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Section
  Widget _buildProfileSection() {
    return Column(
      children: [
        // User Icon
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Username and Email
        Center(
          child: Text(
            userName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            userEmail,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Account Settings Section
  Widget _buildAccountSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),

        // Row for Edit Profile
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Edit Profile',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Edit Profile action
                print('Editing profile');
              },
            ),
          ],
        ),
        const Divider(),

        // Row for Change Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Change Password',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            IconButton(
              icon: const Icon(Icons.lock),
              onPressed: () {
                // Change Password action
                print('Changing password');
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  // Tabs for Books, Rentals, etc.
  Widget _buildTabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: 'Purchased'),
              Tab(text: 'Active Rental'),
              Tab(text: 'Past Rentals'),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                // Purchased Books Section
                _buildPurchasedBooks(),

                // Active Rentals Section
                _buildActiveRentals(),

                // Past Rentals Section
                _buildPastRentals(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Purchased Books Content
  Widget _buildPurchasedBooks() {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Book 1'),
          subtitle: Text('Author: Author 1'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Book 2'),
          subtitle: Text('Author: Author 2'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Book 3'),
          subtitle: Text('Author: Author 3'),
        ),
      ],
    );
  }

  // Active Rentals Content
  Widget _buildActiveRentals() {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Rented Book 1'),
          subtitle: Text('Due: 12/31/2024'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Rented Book 2'),
          subtitle: Text('Due: 01/15/2025'),
        ),
      ],
    );
  }

  // Past Rentals Content
  Widget _buildPastRentals() {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Returned Book 1'),
          subtitle: Text('Returned on: 12/01/2024'),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Returned Book 2'),
          subtitle: Text('Returned on: 11/15/2024'),
        ),
      ],
    );
  }
}
