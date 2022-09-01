class UserModel {
  String? username;
  String? userImage;
  String? job;
  String? bio;
  String? followers;
  String? following;

  UserModel(
      {this.username,
      this.userImage,
      this.job,
      this.bio,
      this.followers,
      this.following});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userImage = json['userImage'];
    job = json['job'];
    bio = json['bio'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['userImage'] = userImage;
    data['job'] = job;
    data['bio'] = bio;
    data['followers'] = followers;
    data['following'] = following;
    return data;
  }
}
