class ApiEndpoints {
  ApiEndpoints._(); // Private constructor to prevent instantiation

  // Timeout durations
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  // Base URLs for local development
  // static const String baseUrl = "http://10.0.2.2:3000/api/"; // Android Emulator
  static const String baseUrl = "http://192.168.10.4:3000/api/";

  // static const String baseUrl = "http://localhost:3000/api/v1/"; // iPhone Simulator

  // Image URL for uploads
  static const String imageUrl = "http://10.0.2.2:3000/profilePicture/";
  static const String uploadImage = "auth/uploadImage";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getUserProfile =
      "auth/profile"; // Fetch logged-in user's profile
  static const String updateUser = "auth/updateUser/"; // Update user info
  static const String deleteUser = "auth/deleteUser/"; // Delete user account

  // ====================== Book Routes ======================
  static const String bookImageUrl = "http://192.168.10.4:3000/book_images/";
  static const String getAllBooks = "books/"; // Fetch all books
  static const String getNewBooks = "books/new/newbooks"; // Fetch new books
  static const String getBestBooks = "books/best/bestbooks"; // Fetch best books
  static const String getBookById =
      "books/:id"; // Get a specific book by ID (append bookId)

  // ====================== Rental Routes ======================
  static const String rentBook = "rental/rent"; // Rent a book
  static const String returnBook =
      "rental/return/"; // Return a rented book (append rentalId)
  static const String getUserRentals =
      "rental/user/"; // Get all rentals of a user (append userId)
  static const String getAllRentals =
      "rental/all"; // Get all rentals (admin feature)

  // ====================== Purchase Routes ======================
  static const String purchaseBook = "purchase/buy"; // Purchase a book
  static const String getUserPurchases =
      "purchase/user/"; // Get purchase history (append userId)
  static const String getAllPurchases =
      "purchase/all"; // Get all purchases (admin feature)

  // ====================== Wishlist Routes ======================
  static const String addToWishlist = "wishlist/add"; // Add book to wishlist
  static const String removeFromWishlist =
      "wishlist/remove/"; // Remove book (append bookId)
  static const String getWishlist =
      "wishlist/user/"; // Get user wishlist (append userId)

  // ====================== Review & Rating Routes ======================
  static const String addReview = "review/add"; // Add review for a book
  static const String getBookReviews =
      "review/book/"; // Get reviews of a book (append bookId)
  static const String updateReview =
      "review/update/"; // Update a review (append reviewId)
  static const String deleteReview =
      "review/delete/"; // Delete a review (append reviewId)
}
