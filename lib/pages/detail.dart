import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Object> args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    print(args['image']);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Grand Resto",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            widthFactor: 0.96,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage(
                "images/${args['image']}",
              ))),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.center,
            heightFactor: 0.2,
            widthFactor: 0.75,
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                 gradient: LinearGradient(
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight,
                   colors: [Color.fromRGBO(234, 92, 140, 0.5),Color.fromRGBO(255, 176, 121, 0.5),],
                   tileMode: TileMode.clamp
                 )
              ),
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nom : Grand Resto", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                   Text("sigle: GR", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10,),
                   Text("Type : Resto Chinois", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
             
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            widthFactor: 0.95,
            child: Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset("images/map.png", fit: BoxFit.cover,)
                  ],
                ),
              ),
            )
          )
          
        ],
      ),
    );
  }
}
