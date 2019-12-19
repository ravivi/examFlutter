import 'dart:convert';
import 'dart:typed_data';

import '../widget/admin_restoItem.dart';
import 'package:flutter/material.dart';
import '../provider/resto_provider.dart';
import 'package:provider/provider.dart';

class AdminRestoScreen extends StatefulWidget {
  @override
  _AdminRestoScreenState createState() => _AdminRestoScreenState();
}

class _AdminRestoScreenState extends State<AdminRestoScreen> {
  String decoImage;

  Uint8List _bytesImage;

  //  refreshList(){
  //   setState(() {
      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final restoData = Provider.of<Restos>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Produicts"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, 'edit');
            },
          )
        ],
      ),
      //drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: restoData.items.length,
          itemBuilder: (_, i) {
            decoImage = restoData.items[i].photo;
            _bytesImage = Base64Decoder().convert(decoImage);
            return Dismissible(
              key: ValueKey(restoData.items[i].id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                restoData.deleteProduct(restoData.items[i].id);
              },
              confirmDismiss: (direction) {
                return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Etes vous sûr"),
                          content: Text("Voulez vous vraiment supprimer"),
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
                child: Icon(Icons.delete, color: Colors.white, size: 40),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              ),
              child: Column(
                children: <Widget>[
                  AdminRestoItem(
                    restoData.items[i].id,
                    restoData.items[i].nom,
                    _bytesImage,
                  ),
                  Divider()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
