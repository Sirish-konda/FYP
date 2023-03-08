class API {
  static const hostConnect = "http://192.168.1.123/fyp_database";
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectAdmin = "$hostConnect/admin";
  static const hostConnectChange = "$hostConnect/change";
  static const hostConnectFavorite = "$hostConnect/favorite";

  //admin login in
  static const adminLogin = "$hostConnectAdmin/login.php";

  //signup User
  static const signUp = "$hostConnectUser/signup.php";

  //validate email
  static const validateEmail = "$hostConnectUser/validate_email.php";

  // user login
  static const login = "$hostConnectUser/login.php";

  //update profile picture
  static const updateProfile = "$hostConnect/change_profile.php";

//update email address
  static const updateEmail = "$hostConnectChange/change_email.php";

//update password
  static const updatePassword = "$hostConnectChange/change_password.php";

//change the favorite for trek
  static const favoriteTrek = "$hostConnectFavorite/toggle_favorite_trek.php";

//get data of users favorite trek
  static const getFavoriteTrek = "$hostConnectFavorite/get_trek_favorite.php";

//change the favorite for hike
  static const favoriteHike = "$hostConnectFavorite/toggle_favorite_hike.php";

//get data of users favorite hike
  static const getFavoriteHike = "$hostConnectFavorite/get_hike_favorite.php";

  //get data of users favorite heritage site
  static const getFavoriteSite = "$hostConnectFavorite/get_site_favorite.php";

//change the favorite for hike
  static const favoriteSite = "$hostConnectFavorite/toggle_favorite_site.php";

  //user feedback for app

  static const feedback = "$hostConnect/userFeedback/feedback.php";
}


//RtmZ&0+L<2Ksw!v&
