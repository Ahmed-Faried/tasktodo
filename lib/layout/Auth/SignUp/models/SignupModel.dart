class SignUpModel {
  SignUpModel({
    required this.id,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });
  late final String id;
  late final String displayName;
  late final String accessToken;
  late final String refreshToken;

  SignUpModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    displayName = json['displayName'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['displayName'] = displayName;
    _data['access_token'] = accessToken;
    _data['refresh_token'] = refreshToken;
    return _data;
  }
}