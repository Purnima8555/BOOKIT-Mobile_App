import 'package:flutter/material.dart';

class SavedView extends StatelessWidget {
  final List<Map<String, String>> savedBooks = [
    {
      "title": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "image": 'assets/images/thegreatgatsby.jpg',
    },
    {
      "title": "The Catcher in the Rye",
      "author": "George Orwell",
      "image": 'assets/images/thecatcherintherye.jpg',
    },
    {
      "title": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "image": 'assets/images/tokillamockingbird.jpg',
    },
  ];

  SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            const Text(
              'Saved Books',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Book List
            Expanded(
              child: ListView.builder(
                itemCount: savedBooks.length,
                itemBuilder: (context, index) {
                  final book = savedBooks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: book["image"] != null
                            ? AssetImage(book["image"]!)
                            : null, // Show image if available
                        backgroundColor: Colors.grey.shade200,
                        child: book["image"] == null
                            ? const Icon(
                                Icons.book,
                                color: Colors.grey,
                              )
                            : null, // Show book icon if no image
                      ),
                      title: Text(
                        book["title"] ?? "Untitled Book",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(book["author"] ?? "Unknown Author"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Handle removing the book from saved list
                          print('Removing ${book["title"]}');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
