class GetUserResponse {
  int? totalUsers;
  Metadata? metadata;
  List<Users>? users;

  GetUserResponse({this.totalUsers, this.metadata, this.users});

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    totalUsers = json['totalUsers'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalUsers'] = this.totalUsers;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['numberOfPages'] = this.numberOfPages;
    data['limit'] = this.limit;
    data['nextPage'] = this.nextPage;
    return data;
  }
}

class Users {
  String? sId;
  String? name;
  String? email;
  String? createdAt;

  Users({this.sId, this.name, this.email, this.createdAt});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
