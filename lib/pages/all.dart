import 'dart:convert';
import 'dart:typed_data';

import '../provider/resto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
    String decoImage;
  Uint8List _bytesImage;

  @override
  Widget build(BuildContext context) {
    final restoData= Provider.of<Restos>(context);
    return Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Grand Resto",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: restoData.items.length,
        itemBuilder: (context,i){
            decoImage = restoData.items[i].photo;
            _bytesImage = Base64Decoder().convert(decoImage);
          return myCont(
                    context,
                    _bytesImage,
                    restoData.items[i].nom,
                    restoData.items[i].ville,
                    restoData.items[i].commune,
                  );
        },
      ),
    );
  }
Widget myCont(BuildContext context, Uint8List image, String title, String ville, String commune) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: {'image': image});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.grey[200], offset: Offset(10.0, 10.0)),
          ],
          color: Colors.grey[100],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: MemoryImage(image), fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.add_location),
                    Text("$ville, $commune"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                     SizedBox(width: 30,),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 }