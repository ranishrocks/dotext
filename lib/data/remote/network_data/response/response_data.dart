class NetworkResponse {}

class NetworkErrorResp extends NetworkResponse {
  int? errorCode;
  String? message;
  NetworkErrorResp({required this.errorCode, this.message});
}

class BrailleInfoAPIResponse extends NetworkResponse {
  late String str;
  late List<int> braille;

  BrailleInfoAPIResponse({required this.str, required this.braille});

  BrailleInfoAPIResponse.fromJson(Map<String, dynamic> json) {
    str = json['str'];
    braille = _parseBrailles(json['braille']);
  }

  List<int> _parseBrailles(List<dynamic> data) {
    List<int> brailleCodes = <int>[];

    data.forEach((element) {
      brailleCodes.add(element);
    });

    return brailleCodes;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['str'] = str;
    data['braille'] = braille;
    return data;
  }
}
