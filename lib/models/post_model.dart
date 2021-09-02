class PostModel {
  int? id;
  int? userId;
  String? title;
  String? body;

  PostModel();

  PostModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.userId = json['userId'];
    this.title = json['title'];
    this.body = json['body'];
  }
}
