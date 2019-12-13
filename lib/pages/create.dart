import 'dart:io';

import 'package:exam/db_helper/resto_db.dart';
import 'package:exam/models/postResto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateResto extends StatefulWidget {
  @override
  _CreateRestoState createState() => _CreateRestoState();
}

class _CreateRestoState extends State<CreateResto> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();
  final resto =Resto_db();
   void initState() {
    resto.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(255, 88, 100, 1),
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                    image: AssetImage("images/resto2.jpg"))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 240,
                          //margin: EdgeInsets.only(left:30, right:30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: TextField(
                              controller: titleController,
                              style: TextStyle(color: Colors.pink),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(255, 88, 100, 1),
                                  ),
                                  hintText: "titre",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                    fontSize: 17,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.camera,
                                  color: Color.fromRGBO(255, 88, 100, 0.5)),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: bodyController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.facebookMessenger,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "Body",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  customButton(context),
                  
                ],
              ),
            )));
  }

  Widget customButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          child: Container(
            width: MediaQuery.of(context).size.height / 4,
            height: 50.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blueAccent, Colors.blueGrey],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                   
                    print(titleController.text.toString());
                    print(bodyController.text.toString());
                    resto.addItem(PostResto(
                        userId: 1,
                        title: titleController.text.toString(),
                        body: bodyController.text.toString()));
                         print(resto.fetchAll());
                  },
                  child: Center(
                    child: customText("Valider",
                        size: 20, weight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        // FlatButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Devenir Propriètaire",
        //     style: TextStyle(color:Color.fromRGBO(255, 88, 100, 1), fontWeight: FontWeight.w700),
        //   ),
        // )
      ],
    );
  }

  Widget customText(String data,
      {double size, FontWeight weight, Color color: Colors.white}) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}
