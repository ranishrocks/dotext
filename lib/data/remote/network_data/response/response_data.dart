class NetworkResponse {}

class NetworkErrorResp extends NetworkResponse {
  int? errorCode;
  String? message;
  NetworkErrorResp({required this.errorCode, this.message});
}

class NameAPIResponse extends NetworkResponse {
  String? name;
  int? nameId;

  NameAPIResponse({this.name, this.nameId});

  NameAPIResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameId = json['name_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['name_id'] = nameId;
    return data;
  }
}
