class Urls {
  static String baseUrl = 'https://quickbook-anshif.onrender.com';
  static String singupUrl = '$baseUrl/api/user_check';
  static String loginUrl = '$baseUrl/api/user_signin';
  static String confirmSignupUrl = '$baseUrl/api/user_signup';
  static String getAllRoomUrl = '$baseUrl/api/getRoomdetails';
  static String getUserDetailsUrl = '$baseUrl/api/user_data';
  static String getRoomBookingDateUrl = '$baseUrl/api/getDates/';
  static String conformRoomBook = '$baseUrl/api/createbooking';
  static String getUserBookedRoom = '$baseUrl/api/bookingData';
  static String addRoomReview = '$baseUrl/api/review';
  static String getReviewRating = '$baseUrl/api/getReiviews/';
  static String cancelBooking = '$baseUrl/api/cancelbooking';
  static String getWishlist = '$baseUrl/api/wishlist/';
  static String addWishlist = '$baseUrl/api/wishlist/add';
  static String removeFromWishlist = '$baseUrl/api//delete-wishlist/';
  static String getRoomCoupons = '$baseUrl/api/getCoupon/';
  static String applyCoupon = '$baseUrl/api/coupnapply';
  static String roomBookingSuccess = '$baseUrl/api/successData/';
  static String editProfile = '$baseUrl/api/editProfile';
  static String changePassword = '$baseUrl/api/editpassword';
}
