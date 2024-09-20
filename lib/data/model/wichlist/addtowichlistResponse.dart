class AddtoWichListResponse {
  String? status;
  String? message;
  List<String>? data;

  AddtoWichListResponse({this.status, this.message, this.data});

  AddtoWichListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}