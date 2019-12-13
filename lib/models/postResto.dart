import 'package:http/http.dart' as http;
import 'dart:convert';

Future getPost() async {
  final res = await http.get("https://jsonplaceholder.typicode.com/posts");
  Iterable list = json.decode(res.body);
  List<PostResto> arr = list.map((item) => PostResto.fromJson(item)).toList();
  return arr;
}

class PostResto {
  int userId;
  int id;
  String title;
  String body;

  PostResto({this.userId, this.id, this.title, this.body});

  factory PostResto.fromJson(Map<String, dynamic> json) {
    return PostResto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
  factory PostResto.fromDb(Map<String, dynamic> map) {
    return PostResto(
      userId: map['userId'],
      id: map['id'],
      title:map['title'],
      body:map['body'],
    );
  }
    Map<String, dynamic> toMap() {
    return <String, dynamic>{
    'userId': userId,
    'id' : id,
    'title' : title,
    'body' : body
    };
   
    
  }
}
