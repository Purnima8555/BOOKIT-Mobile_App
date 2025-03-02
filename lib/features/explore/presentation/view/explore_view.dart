import 'package:bookit_flutter_project/features/explore/presentation/view_model/explore_bloc.dart';
import 'package:bookit_flutter_project/features/saved/presentation/view_model/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  String selectedGenre = 'All';
  String selectedSortOption = 'Default';
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> genres = [
    {'name': 'All', 'icon': Icons.apps, 'color': const Color(0xFF6A1B9A)},
    {
      'name': 'Art & Photography',
      'img': 'assets/category_icons/art_photography.png'
    },
    {'name': 'Biography', 'img': 'assets/category_icons/biography.png'},
    {'name': 'Business', 'img': 'assets/category_icons/business.png'},
    {'name': 'Children', 'img': 'assets/category_icons/children.png'},
    {'name': 'Drama', 'img': 'assets/category_icons/drama.png'},
    {'name': 'Educational', 'img': 'assets/category_icons/education.png'},
    {'name': 'Fantasy', 'img': 'assets/category_icons/fantasy.png'},
    {'name': 'Horror', 'img': 'assets/category_icons/horror.png'},
    {'name': 'Mystery', 'img': 'assets/category_icons/mystery.png'},
    {'name': 'Romance', 'img': 'assets/category_icons/romance.png'},
    {'name': 'Science', 'img': 'assets/category_icons/scifi.png'},
    {'name': 'Self-help', 'img': 'assets/category_icons/selfhelp.png'},
  ];

  final List<String> sortOptions = [
    'Default',
    'Price: Low to High',
    'Price: High to Low',
  ];

  @override
  void initState() {
    super.initState();
    context.read<ExploreBloc>().add(LoadAllBooksEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: const Color(0xFF1E2751),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 5.0),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Explore Books',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(top: 10, right: 16.0),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isSearchActive = !_isSearchActive;
                  if (!_isSearchActive) _searchController.clear();
                });
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFF5F5F5),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: _isSearchActive ? 80.0 : 0.0),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 155,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        final isSelected = selectedGenre == genre['name'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGenre = genre['name'];
                            });
                            if (selectedGenre == 'All') {
                              context
                                  .read<ExploreBloc>()
                                  .add(LoadAllBooksEvent());
                            } else {
                              context.read<ExploreBloc>().add(
                                  LoadBooksByGenreEvent(genre: selectedGenre));
                            }
                          },
                          child: Container(
                            width: 115,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: isSelected
                                  ? Border.all(color: Colors.grey, width: 3)
                                  : null,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (genre['name'] == 'All')
                                  Icon(
                                    genre['icon'],
                                    color: const Color(0xFF1E2751),
                                    size: 48,
                                  )
                                else
                                  Image.asset(
                                    genre['img'],
                                    width: 48,
                                    height: 48,
                                  ),
                                const SizedBox(height: 8),
                                Text(
                                  genre['name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                if (isSelected)
                                  Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    width: 40,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sort By:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E2751),
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedSortOption,
                            dropdownColor: Colors.white,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Color(0xFF1E2751)),
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedSortOption = newValue;
                                });
                              }
                            },
                            items: sortOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Color(0xFF1E2751),
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ExploreBloc, ExploreState>(
                  builder: (context, exploreState) {
                    if (exploreState.isLoading) {
                      return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()));
                    } else if (exploreState.error.isNotEmpty) {
                      return SliverFillRemaining(
                          child: Center(child: Text(exploreState.error)));
                    } else {
                      final books = selectedGenre == 'All'
                          ? exploreState.books
                          : exploreState.booksByGenre;
                      List<dynamic> sortedBooks = List.from(books);
                      if (selectedSortOption == 'Price: Low to High') {
                        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
                      } else if (selectedSortOption == 'Price: High to Low') {
                        sortedBooks.sort((a, b) => b.price.compareTo(a.price));
                      }
                      return SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: BlocBuilder<SavedBloc, SavedState>(
                          builder: (context, savedState) {
                            return SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final book = sortedBooks[index];
                                  final isSaved = savedState.savedBooks.any(
                                      (savedBook) =>
                                          savedBook.bookId == book.bookId);
                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20)),
                                                ),
                                                child: Center(
                                                  child: book.image.isNotEmpty
                                                      ? Image.network(
                                                          book.image,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : const Icon(Icons.book,
                                                          size: 50,
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      book.title,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      book.author,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      'Rs ${book.price.toInt()}',
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            180, 64, 66, 82),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (isSaved) {
                                              final favoriteId = savedState
                                                  .savedBooks
                                                  .firstWhere((savedBook) =>
                                                      savedBook.bookId ==
                                                      book.bookId)
                                                  .favoriteId;
                                              context.read<SavedBloc>().add(
                                                  RemoveSavedBookEvent(
                                                      favoriteId: favoriteId));
                                            } else {
                                              context.read<SavedBloc>().add(
                                                  AddSavedBookEvent(
                                                      bookId: book.bookId));
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSaved
                                                  ? Colors.white
                                                  : const Color(0xFF1E2751),
                                              border: Border.all(
                                                  color: Colors.grey[400]!,
                                                  width: 2),
                                            ),
                                            child: Icon(
                                              isSaved
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                              color: isSaved
                                                  ? const Color(0xFF1E2751)
                                                  : Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                childCount: sortedBooks.length,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          // Search field with updated style
          if (_isSearchActive)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: const Color(0xFF1E2751),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Search books, authors...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _isSearchActive = false;
                          });
                        },
                      ),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        _isSearchActive = false;
                      });
                      // Add search logic here if needed
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
