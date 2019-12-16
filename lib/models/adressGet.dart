import 'package:http/http.dart' as http;
import 'dart:convert';

Future getListAdress() async {
  final res = await http.get("http://192.168.50.85:1337/address");
  Iterable list = json.decode(res.body);
  print(res);
  List<Adresse> arr = list.map((item) => Adresse.fromJson(item)).toList();
  return arr;
}

class Adresse {
  int id;
  String commune;
  String ville;
  double logitude;
  double latitude;

  Adresse(
      {
      this.id,
      this.commune,
      this.ville,
      this.logitude,
      this.latitude});

  factory Adresse.fromJson(Map<String, dynamic> json) {
    return Adresse(
        id: json['id'],
        commune: json['commune'],
        ville: json['ville'],
        logitude: json['logitude'],
        latitude: json['latitude']);
  }

}
