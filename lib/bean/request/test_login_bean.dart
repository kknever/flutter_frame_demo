class LoginParam {
  String? username;
  String? userpwd;

  LoginParam({this.username, this.userpwd});

  LoginParam.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userpwd = json['userpwd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userpwd'] = this.userpwd;
    return data;
  }
}