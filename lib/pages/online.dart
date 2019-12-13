import 'package:exam/models/photo.dart';
import 'package:exam/models/postResto.dart';
import 'package:flutter/material.dart';

class Online extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: getList(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<PostResto> list = snapshot.data;
            print(list);
            return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,i){
          return ListTile(
            title: Text(list[i].title),
          );
        },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
  
  Widget myCont(BuildContext context, String image, String title) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'detail', arguments: {'image':image});
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                    image: NetworkImage("${image}"), fit: BoxFit.fitHeight),
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
                    Text("Abidjan, Cocody"),
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