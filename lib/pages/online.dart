

import 'package:exam/models/restoGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditOnline extends StatefulWidget {
  @override
  _EditOnlineState createState() => _EditOnlineState();
}

class _EditOnlineState extends State<EditOnline> {

  List<Resto> listeResto = [];

  @override
  initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Mes restos Online",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, 'createOnline');
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: getList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, i) {
                     Resto item = snapshot.data[i];
                    return Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        http.delete("http://192.168.50.85:1337/resto/${item.id}");
                      },
                      confirmDismiss: (direction) {
                        return showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Etes vous sûr"),
                                  content:
                                      Text("Voulez vous vraiment supprimer"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Non"),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("Oui"),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                    ),
                                  ],
                                ));
                      },
                      background: Container(
                        color: Theme.of(context).errorColor,
                        child:
                            Icon(Icons.delete, color: Colors.white, size: 40),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(item.photo),
                              maxRadius: 30,
                            ),
                            title: Text(item.name),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {},
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Theme.of(context).errorColor,
                                    onPressed: () {
                                      //resto.deleteItem(item.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
             return Center(
              child: SpinKitCircle(
                color: Color.fromRGBO(210, 3, 6, 1),
                size: 90.0,
              ),
            
              );
            }
          },
        ));
  }
}


