class UsersDetailsModel {
  final int id;
  final String name;
  final String email;
  final String feedback;
  final String rating;
  final String satisfaction;
  String? profile;

  UsersDetailsModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.feedback,
      required this.rating,
      required this.satisfaction,
      this.profile});

  factory UsersDetailsModel.fromJson(Map<String, dynamic> json) {
    return UsersDetailsModel(
      id: int.parse(json['user_id']),
      name: json['user_name'],
      email: json['user_email'],
      feedback: json['feedback'],
      rating: json['rating'],
      satisfaction: json['satisfaction'],
      profile: json['photo'],
    );
  }
}
