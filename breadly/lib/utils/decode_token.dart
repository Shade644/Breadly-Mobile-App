import 'dart:convert';

Map<String, dynamic> decodeJwt(String token) {
  List<String> parts = token.split('.');
  String decodedData = utf8.decode(base64Url.decode(parts[1]));
  print("Zdekodowane"+decodedData.toString());
  return json.decode(decodedData);
}