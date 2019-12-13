import 'package:carousel_pro/carousel_pro.dart';
import 'package:exam/pages/edit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'all.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,),
       
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Grand Resto",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello",style: TextStyle(color: Colors.white),),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed( '/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Commande"),
            onTap: (){
              
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Mes Produits"),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Edit()));
            },
          ),
        ],
      ),
    ),
  
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxHeight: 170),
                    child: moncarousel(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Ville",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ville("Abidjan", "abidjan.jpg"),
                        ville("Yamoussoukro", "yakro.jpg"),
                        ville("Bouaké", "boua.jpg"),
                        ville("Assinie", "assinie.jpg"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Restaurant",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 20)),
                          GestureDetector(
                            onTap: (){
                              
                              Navigator.push(context, PageTransition(type: PageTransitionType.upToDown,duration: Duration(milliseconds: 800), child: All()));
                            },
                            child: Text("Voir +", style: TextStyle(color: Colors.redAccent),),
                          )

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  myCont(context, "resto2.jpg"),
                  myCont(context, "resto3.jpg"),
                  myCont(context, "resto4.jpg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ville(String vil, String image) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        left: 30,
      ),
      padding: EdgeInsets.only(top: 5, left: 10),
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
            image: AssetImage("images/${image}"), fit: BoxFit.cover),
      ),
      child: Text(
        vil,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget myCont(BuildContext context, String image) {
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
                    image: AssetImage("images/${image}"), fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Grand Restaurant",
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

  Widget moncarousel() {
    return Container(
      height: 200,
      child: Carousel(
        autoplay: true,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(
          seconds: 4,
        ),
        dotSize: 4,
        indicatorBgPadding: 10,
        boxFit: BoxFit.cover,
        borderRadius: true,
        images: [
          AssetImage("images/food.jpg"),
          AssetImage("images/resto2.jpg"),
          AssetImage("images/resto3.jpg"),
          AssetImage("images/resto4.jpg"),
        ],
      ),
    );
  }
}
