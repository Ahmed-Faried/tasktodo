class ProfileModel {
  ProfileModel({
    required this.id,
    required this.displayName,
    required this.username,
    required this.roles,
    required this.active,
    required this.experienceYears,
    required this.address,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String displayName;
  late final String username;
  late final List<String> roles;
  late final bool active;
  late final int experienceYears;
  late final String address;
  late final String level;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    displayName = json['displayName'];
    username = json['username'];
    roles = List.castFrom<dynamic, String>(json['roles']);
    active = json['active'];
    experienceYears = json['experienceYears'];
    address = json['address'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['displayName'] = displayName;
    _data['username'] = username;
    _data['roles'] = roles;
    _data['active'] = active;
    _data['experienceYears'] = experienceYears;
    _data['address'] = address;
    _data['level'] = level;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}