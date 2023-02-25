class API {
  static const hostConnect = "http://192.168.0.2/fyp_database";
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

  //login
  static const login = "$hostConnectUser/login.php";

  //update profile

  static const updateProfile = "$hostConnect/change_profile.php";

  static const updateEmail = "$hostConnectChange/change_email.php";

  static const updatePassword = "$hostConnectChange/change_password.php";

  static const favoriteTrek = "$hostConnectFavorite/toogle_favorite_trek.php";

  static const getFavoriteTrek = "$hostConnectFavorite/get_trek_favorite.php";
}


//RtmZ&0+L<2Ksw!v&
