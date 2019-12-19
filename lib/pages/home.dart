import 'package:carousel_pro/carousel_pro.dart';
import '../models/adressGet.dart';
import '../models/restoGet.dart';
import '../pages/drawer_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import 'all.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Adresse> listeAdress = [];
  List<Resto> listeResto = [];

  @override
  initState() {
    charge();
    chargeResto();
    super.initState();
  }

  Future charge() async {
    print('Chagement.......................');
    List<Adresse> myList = await getListAdress();
    print(myList);
    setState(() {
      print(myList.length);
      print('depart');
      listeAdress = myList;
      print('Fin');
      print(myList.length);
    });
  }

  Future chargeResto() async {
    print('Chagement.......................');
    List<Resto> myList = await getList();
    print(myList);
    setState(() {
      print(myList.length);
      print('depart');
      listeResto = myList;
      print('Fin');
      print(myList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(listeResto[0].photo);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Grand Resto",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Menu(context),
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
                  Text("Commune",
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
                    child: FutureBuilder(
                      future: getListAdress(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listeAdress.length,
                            itemBuilder: (context, i) {
                              return ville(
                                  listeAdress[i].commune, "abidjan.jpg");
                            },
                          );
                        } else {
                          return Center(
                              child: SpinKitCircle(
                            color: Color.fromRGBO(210, 3, 6, 1),
                            size: 90.0,
                          ));
                        }
                      },
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
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.upToDown,
                                  duration: Duration(milliseconds: 800),
                                  child: All()));
                        },
                        child: Text(
                          "Voir +",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: getList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            myCont(
                              context,
                              listeResto[0].photo,
                              listeResto[0].name,
                              listeResto[0].address.ville,
                              listeResto[0].address.commune,
                              listeResto[0].tel,
                            ),
                            myCont(
                              context,
                              listeResto[1].photo,
                              listeResto[1].name,
                              listeResto[1].address.ville,
                              listeResto[1].address.commune,
                              listeResto[1].tel,
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: SpinKitCircle(
                          color: Color.fromRGBO(210, 3, 6, 1),
                          size: 90.0,
                        ));
                      }
                    },
                  ),
                  // myCont(
                  //   context,
                  //   listeResto[1].photo,
                  //   listeResto[2].name,
                  //   listeResto[3].address.ville,
                  //   listeResto[0].address.commune,
                  //   listeResto[0].tel,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ville(
    String vil,
    String image,
  ) {
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

  Widget myCont(BuildContext context, String image, String title, String ville,
      String commune, int numero) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail',
            arguments: {'image': image, 'numero': numero});
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
                    image: NetworkImage(image), fit: BoxFit.fitHeight),
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
                    SizedBox(
                      width: 30,
                    ),
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
