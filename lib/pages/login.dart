import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../db_helper/resto_db.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.blue,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(100),
                // ),
                image: DecorationImage(
                    image: AssetImage("images/food.jpg"), fit: BoxFit.cover),
              )),
            ),
            Expanded(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    myrow("Email", Icons.person),
                    SizedBox(
                      height: 10,
                    ),
                    myrow("Mot de passe", Icons.visibility_off),
                    //SizedBox(height: 10,),
                    Center(
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Mot de passe oublié?",
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: MaterialButton(
                          color: Color.fromRGBO(87, 30, 3, 1),
                          child: Text("Connexion", style: TextStyle(color: Colors.white, fontSize: 18),),
                          onPressed: () {
                            Navigator.pushNamed(context, 'nav');
                          },
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }

  Widget myrow(String text, IconData icon) {
    return Row(
      children: <Widget>[
        Container(
          height: 55,
          width: 240,
          //margin: EdgeInsets.only(left:30, right:30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              style: TextStyle(color: Colors.pink),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    FontAwesomeIcons.keyboard,
                    color: Color.fromRGBO(255, 88, 100, 1),
                  ),
                  hintText: text,
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
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(icon, color: Color.fromRGBO(255, 88, 100, 0.5)))
      ],
    );
  }
}
