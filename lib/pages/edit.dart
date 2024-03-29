import 'dart:convert';
import 'dart:typed_data';

import 'package:grand_resto/db_helper/db_helper.dart';

import '../models/postResto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  List img = ["food.jpg", "resto2.jpg", "resto3.jpg", "resto4.jpg"];
  String decoImage;
    Uint8List _bytesImage;

    bool isUpdating;
    var dbHelper;
    Future<List<PostResto>> restos;
  
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    isUpdating = false;
    refreshList();
  }
  refreshList(){
    setState(() {
      restos = dbHelper.getResto();
    });
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
            "Mes restos Offline",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, 'create');
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: restos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, i) {
                     PostResto item = snapshot.data[i];
                      decoImage=item.image;
                     _bytesImage = Base64Decoder().convert(decoImage);
                    return Dismissible(
                      key: ValueKey(item.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        dbHelper.delete(item.id);
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
                              backgroundImage: MemoryImage(_bytesImage),
                              maxRadius: 30,
                            ),
                            title: Text(item.nom),
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
                                     dbHelper.delete(item.id);
                                     refreshList();
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
            } if(null == snapshot.data || snapshot.data.length == 0){
              return Center(child: Text("Aucune Données dans la base de donnée"),);
            }
             
              return Center(
              child: SpinKitCircle(
                color: Color.fromRGBO(210, 3, 6, 1),
                size: 90.0,
              ),
            
              );
            
          },
        ));
  }
}
