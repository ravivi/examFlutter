import 'package:exam/db_helper/resto_db.dart';
import 'package:exam/models/postResto.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  List img = ["food.jpg", "resto2.jpg", "resto3.jpg", "resto4.jpg"];

  final resto = Resto_db();
  void initState() {
   resto.init();
    resto.fetchAll();
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
            "Mes restos",
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
          future: resto.fetchAll(),
          builder: (context, snapshot) {
            Iterable list = snapshot.data;
            List<PostResto> arr =
                list.map((item) => PostResto.fromJson(item)).toList();

            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: arr.length,
                  itemBuilder: (_, i) {
                    return Dismissible(
                      key: ValueKey(arr[i].id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        resto.deleteItem(arr[i].id);
      },
      confirmDismiss: (direction){
        return showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text("Etes vous sûr"),
          content: Text("Voulez vous vraiment supprimer"),
          actions: <Widget>[
            FlatButton(
              child: Text("Non"),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text("Oui"),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ));},
         background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size:40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            // leading: CircleAvatar(
                            //   backgroundColor: Colors.white,
                            //   backgroundImage: AssetImage("images/${img[i]}"),
                            //   maxRadius: 30,
                            // ),
                            title: Text(arr[i].title),
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
                                      resto.deleteItem(arr[i].id);
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
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
