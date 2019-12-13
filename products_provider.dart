import 'package:flutter/cupertino.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: "p1",
    //   title: "Nike",
    //   description: "Le plus beau nike",
    //   price: 100000,
    //   image: "nikezo.jpg",
    // ),
    // Product(
    //   id: "p2",
    //   title: "Robe",
    //   description: "Le plus belle robe",
    //   price: 3000,
    //   image: "robe.jpg",
    // ),
    // Product(
    //   id: "p3",
    //   title: "Talon",
    //   description: "Le plus beau Talon",
    //   price: 4000,
    //   image: "rougetalon.jpg",
    // ),
    // Product(
    //   id: "p4",
    //   title: "Sac",
    //   description: "Le plus beau sac",
    //   price: 7000,
    //   image: "sac.jpg",
    // ),
  ];
  //var _showOnlyFavorite= false;

  List<Product> get items {
    // if(_showOnlyFavorite){
    //   return _items.where((prodItem)=>prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
  // void showOnlyFavorite(){
  //   _showOnlyFavorite = true;
  //   notifyListeners();
  // }
  // void showAll(){
  //   _showOnlyFavorite = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetProduct() async {
    const url = 'https://newapp-27cef.firebaseio.com/products.json';
    try{
      final response = await http.get(url);
      final extratedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProduct = [];
      extratedData.forEach((prodId, prodData){
        loadedProduct.add(Product(
          id: prodId,
          title: prodData['title'],
           price: prodData['price'],
            description: prodData['description'],
             image: prodData['image'],
             isFavorite:  prodData['isFavorite']
        ));
      });
      _items = loadedProduct;
      notifyListeners();
    }catch(error){
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://newapp-27cef.firebaseio.com/products.json';
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'image': product.image,
            'isFavorite': product.isFavorite,
          }));
      print(json.decode(response.body));
      final newProduct = Product(
        title: product.title,
        price: product.price,
        description: product.description,
        image: product.image,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
