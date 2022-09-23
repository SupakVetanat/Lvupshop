class Profile {
  String? profileImage;
  String email;
  String password;
  String repassword;
  String? username;
  String birth;
  String gender;
  String? description;
  Profile(
      {required this.email,
      required this.profileImage,
      required this.password,
      required this.repassword,
      required this.username,
      required this.birth,
      required this.gender,
      this.description});
}
