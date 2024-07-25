class SignInModel {
  SignInModel({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });
  late final String id;
  late final String accessToken;
  late final String refreshToken;

  SignInModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['access_token'] = accessToken;
    _data['refresh_token'] = refreshToken;
    return _data;
  }
}