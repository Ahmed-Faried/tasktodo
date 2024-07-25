class TaskDetailsModel {
  TaskDetailsModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String image;
  late final String title;
  late final String desc;
  late final String priority;
  late final String status;
  late final String user;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  TaskDetailsModel.fromJson(Map<String, dynamic> json){
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    status = json['status'];
    user = json['user'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['title'] = title;
    _data['desc'] = desc;
    _data['priority'] = priority;
    _data['status'] = status;
    _data['user'] = user;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}