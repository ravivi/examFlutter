import 'package:flutter/material.dart';

import 'drawer_app.dart';

class Favorite extends StatelessWidget {
    List img =[
    "food.jpg",
    "resto2.jpg",
    "resto3.jpg",
    "resto4.jpg"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Mes favoris",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,

          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      drawer: Menu(context),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemCount: img.length,
        itemBuilder: (context, i){
          return   Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
              //color: Color(0xFFfaecfb),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.withOpacity(.3),
                width: 4,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Image.asset(
                  "images/${img[i]}",
                  width: 281,
                  height: 191,
                ),
                Text(
                  "Grand Resto",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.redAccent,),
                        onPressed: () {},
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Abidjan",
                            style: TextStyle(
                              color: Color(0xFFfeb0ba),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Sr",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.redAccent,),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        
        },
      ),
    );
  }
}
