import 'package:http/http.dart' as http;
import 'dart:convert';

Future getList() async {
  final res = await http.get("https://jsonplaceholder.typicode.com/photos");
  Iterable list = json.decode(res.body);
  List<Photo> arr = list.map((item) => Photo.fromJson(item)).toList();
  return arr;
}

// makePostRequest() async {  // set up POST request arguments
//   String url = 'https://jsonplaceholder.typicode.com/posts';
//   Map<String, String> headers = {"Content-type": "application/json"};
//   String json = '{"title": "Hello", "body": "body text", "userId": 1}';  // make POST request
//   final response = await http.post(url, headers: headers, body: json);  // check the status code for the result
//   int statusCode = response.statusCode;  // this API passes back the id of the new item added to the body
//   String body = response.body;
//   {
//     "title": "Hello",
//     "body": "body text",
//     "userId": 1,
//     "id": 101
//   }
//   }

class PhotoList {
  final List<PhotoList> photoList;
  PhotoList({this.photoList});
  factory PhotoList.fromJson(List<dynamic> json) {
    List<PhotoList> arr = new List<PhotoList>();
    arr = json.map((item) => PhotoList.fromJson(item)).toList();
    return PhotoList(photoList: arr);
  }
}

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
