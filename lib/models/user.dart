class User {
  int userId;
  String userName;
  String userEmail;
  String userPassword;
  String? userProfile;

  User(
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userProfile,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      int.parse(json['user_id']),
      (json['user_name']),
      (json['user_email']),
      (json['user_password']),
      (json['user_profile']),
    );
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId.toString(),
        'user_name': userName,
        'user_email': userEmail,
        'user_password': userPassword,
        'user_profile': userProfile,
      };
}

class UserPhoto {
  String userEmail;
  String userProfile;

  UserPhoto({required this.userEmail, required this.userProfile});

  factory UserPhoto.fromJson(Map<String, dynamic> json) {
    return UserPhoto(
      userEmail: json['user_email'],
      userProfile: 'user_profile',
    );
  }

  Map<String, dynamic> toJson() => {
        'user_email': userEmail,
        'user_profile': userProfile,
      };
}
