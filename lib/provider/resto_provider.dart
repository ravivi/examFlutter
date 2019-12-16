import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/foundation.dart';


class Resto with ChangeNotifier {
  final String id;
  final String nom;
  final String photo;
  final String sigle;
  final String tel;
  final String ville;
  final String commune;
  final String type;

  Resto(
      {
      @required this.id,
      @required this.nom,
      @required this.photo,
      @required this.sigle,
      @required this.tel,
      @required this.ville,
      @required this.commune,
      @required this.type,
      });
}


class Restos with ChangeNotifier {
  List<Resto> _items = [];

  List<Resto> get items {
    return [..._items];
  }

  Resto findById(String id) {
    return _items.firstWhere((rest) => rest.id == id);
  }

  Future<void> fetchAndSetProduct() async {
    const url = 'https://exam-58d38.firebaseio.com/restos.json';
    try{
      final response = await http.get(url);
      final extratedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Resto> loadedResto = [];
      extratedData.forEach((restoId, restoData){
        loadedResto.add(Resto(
          id: restoId,
          nom: restoData['nom'],
          photo: restoData['photo'],
          sigle: restoData['sigle'],
          tel: restoData['tel'],
          ville: restoData['ville'],
          commune: restoData['commune'],
          type: restoData['type'],
           
        ));
      });
      _items = loadedResto;
      notifyListeners();
    }catch(error){
      throw error;
    }
  }

  Future<void> addResto(Resto resto) async {
    const url = 'https://exam-58d38.firebaseio.com/restos.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'nom': resto.nom,
            'photo': resto.photo,
            'sigle': resto.sigle,
            'tel': resto.tel,
            'ville': resto.ville,
            'commune': resto.commune,
            'type': resto.type,

          }));
      print(json.decode(response.body));
      final newResto = Resto(
        nom: resto.nom,
            photo: resto.photo,
            sigle: resto.sigle,
            tel: resto.tel,
            ville: resto.ville,
            commune: resto.commune,
            type: resto.type,
        id: json.decode(response.body)['nom'],
      );
      _items.add(newResto);

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  // void updateProduct(String id, Resto newResto) {
  //   final prodIndex = _items.indexWhere((prod) => prod.id == id);
  //   if (prodIndex >= 0) {
  //     _items[prodIndex] = newResto;
  //     notifyListeners();
  //   } else {
  //     print('...');
  //   }
  // }

  // void deleteProduct(String id) {
  //  // _items.removeWhere((rest) => rest.id == id);
  //  http.delete(".json/${id}");
  //   notifyListeners();
  // }
    Future<void> updateProduct(String id, Resto resto) async {
    final restIndex = _items.indexWhere((prod) => prod.id == id);
    if (restIndex >= 0) {
      final url = 'https://exam-58d38.firebaseio.com/restos/$id.json';
      await http.patch(url,
          body: json.encode({
             'nom': resto.nom,
            'photo': resto.photo,
            'sigle': resto.sigle,
            'tel': resto.tel,
            'ville': resto.ville,
            'commune': resto.commune,
            'type': resto.type,
          }));
      _items[restIndex] = resto;
      notifyListeners();
    } else {
      print('...');
    }
  }
    Future<void> deleteProduct(String id) async {
    final url = 'https://exam-58d38.firebaseio.com/restos/$id.json';
    final existingRestoIndex = _items.indexWhere((rest) => rest.id == id);
    var existingResto = _items[existingRestoIndex];
    _items.removeAt(existingRestoIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingRestoIndex, existingResto);
      notifyListeners();
      throw HttpException('impossible de supprimer.');
    }
    existingResto = null;
  }
}
