class Parameters {
  String? apiName;
  int? userId;
  String? url;

  Parameters({this.apiName, this.userId, this.url});

  Parameters.fromJson(Map<String, dynamic> json) {
    apiName = json['apiName'] ?? null;
    userId = json['userId'] ?? null;
    url = json['url'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiName'] = this.apiName;
    data['userId'] = this.userId;
    data['url'] = this.url;
    return data;
  }
}
