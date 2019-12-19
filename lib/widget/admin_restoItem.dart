import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../provider/resto_provider.dart';
import 'package:provider/provider.dart';

class AdminRestoItem extends StatelessWidget {
  final String id;
  final String title;
  final Uint8List image;

  const AdminRestoItem(this.id,this.title, this.image);
  
  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: MemoryImage(image),
        maxRadius: 30,
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
            Navigator.of(context).pushNamed('modifier', arguments: id);

              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () async {
                try {
                  await Provider.of<Restos>(context,listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('Deleting failed!', textAlign: TextAlign.center,),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}