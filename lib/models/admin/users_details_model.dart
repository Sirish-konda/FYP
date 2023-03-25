class UsersDetailsModel {
  int? id;
  String? name;
  String? email;
  String? feedback;
  String? rating;
  String? satisfaction;
  String? profile;

  UsersDetailsModel(
      {this.id,
      this.name,
      this.email,
      this.feedback,
      this.rating,
      this.satisfaction,
      this.profile});

  factory UsersDetailsModel.fromJson(Map<String, dynamic> json) {
    return UsersDetailsModel(
      id: int.parse(json['user_id']),
      name: json['user_name'],
      email: json['user_email'],
      feedback: json['feedback'],
      rating: json['rating'],
      satisfaction: json['satisfaction'],
      profile: json['user_profile'],
    );
  }
}
