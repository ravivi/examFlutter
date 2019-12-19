import '../pages/testConnexion.dart';
import 'package:flutter/material.dart';

Widget Menu(context) {
  return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: UserAccountsDrawerHeader(
              accountName: Text('Octave N\'dry'),
              accountEmail: Text('jeremiedry@gmail.com'),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/resto2.jpg'))),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Editer Resto'),
            onTap: () {
              // This line code will close drawer programatically....
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Connection()));
            },
          ),
          
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification'),
            onTap: () {
              showAlertDialog(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()));
            },
          ),
          Divider(
            height: 10.0,
          ),
          ListTile(
            leading: Icon(Icons.cancel),
            title: Text('Deconnexion'),
            onTap: () {
              //Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail()));
            },
          )
        ],
      ));
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget remindButton = FlatButton(
    child: Text("Me Rappeler après"),
    onPressed: () {},
  );
  Widget cancelButton = FlatButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notification"),
    content: Text("Une nouvelle maison vient d'être ajoutée"),
    actions: [
      remindButton,
      cancelButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
