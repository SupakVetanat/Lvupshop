class Profile {
  String? profileImage;
  String email;
  String password;
  String repassword;
  String? username;
  String birth;
  String gender;
  String? description;
  bool? guarantee;
  int? star;
  Profile(
      {required this.email,
      required this.profileImage,
      required this.password,
      required this.repassword,
      required this.username,
      required this.birth,
      required this.gender,
      this.description,
      this.star,
      this.guarantee});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'],
      birth: json['birthday'],
      email: json['email'],
      gender: json['gender'],
      repassword: json['password'],
      profileImage: json['profileImage'],
      password: json['password'],
      star: json['star'],
      guarantee: json['guarantee'],
    );
  }
}
