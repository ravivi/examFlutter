import 'dart:io';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      image: NetworkImage(
                args['image'],
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
            floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          call(),
          message(),
          whatsapp(),
          
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );
  }


  sendMessage() async {
    if (Platform.isAndroid) {
      //FOR Android
      var url =
          'sms:++22587870343?body=bonjour je viens par rapport à la maison';
      await launch(url);
    } else if (Platform.isIOS) {
      //FOR IOS
      var url = 'sms:+6000000000&body=message';
    }
  }

  Widget message() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(59, 89, 152, 1),
        onPressed: () {
          sendMessage();
        },
        heroTag: "Message",
        tooltip: 'Message',
        child: Icon(
          Icons.message,
          size: 30,
        ),
      ),
    );
  }

  Widget call() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(59, 89, 152, 1),
        onPressed: () {
          launch("tel://+22587870343");
        },
        heroTag: "call",
        tooltip: 'call',
        child: Icon(
          FontAwesomeIcons.phone,
          size: 30,
        ),
      ),
    );
  }

  Widget whatsapp() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
        },
        heroTag: "whatsapp",
        tooltip: 'whatsapp',
        child: Icon(
          FontAwesomeIcons.whatsapp,
          size: 30,
        ),
      ),
    );
  }
}

class PageSilv extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return PageSilvState();
  }

}
class PageSilvState extends State<PageSilv> {
 

  @override
  Widget build(BuildContext context) {
     Map<String, Object> args =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    print(args['image']);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  
                  background: Image.network(
                    "${args['image']}",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                     Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                 gradient: LinearGradient(
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight,
                   colors: [Colors.grey[100],Color.fromRGBO(255, 176, 121, 0.5),],
                   tileMode: TileMode.clamp
                 )
              ),
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nom : Grand Resto", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                   Text("sigle: GR", style: TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10,),
                   Text("Type : Resto Chinois", style: TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                ],
              ),
             
            ),
            SizedBox(height: 20,),
             GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        avatar: CircleAvatar(
                          backgroundImage: AssetImage('images/local.png'),
                          backgroundColor: Colors.white,
                        ),
                        label: Text(
                          'Voir Localication',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.grey[40],
                        padding: EdgeInsets.all(4),
                      ),
                    ),
                  ),

                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 200,
                        maxWidth: MediaQuery.of(context).size.width
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/map.png",),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        
      ),
           floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          call(),
          message(),
          whatsapp(),
          
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
    );

  }
  
  sendMessage() async {
    if (Platform.isAndroid) {
      //FOR Android
      var url =
          'sms:++22587870343?body=bonjour je viens par rapport à la maison';
      await launch(url);
    } else if (Platform.isIOS) {
      //FOR IOS
      var url = 'sms:+6000000000&body=message';
    }
  }

  Widget message() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(59, 89, 152, 1),
        onPressed: () {
          sendMessage();
        },
        heroTag: "Message",
        tooltip: 'Message',
        child: Icon(
          Icons.message,
          size: 30,
        ),
      ),
    );
  }

  Widget call() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(59, 89, 152, 1),
        onPressed: () {
          launch("tel://+22587870343");
        },
        heroTag: "call",
        tooltip: 'call',
        child: Icon(
          FontAwesomeIcons.phone,
          size: 30,
        ),
      ),
    );
  }

  Widget whatsapp() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {

        },
        heroTag: "whatsapp",
        tooltip: 'whatsapp',
        child: Icon(
          FontAwesomeIcons.whatsapp,
          size: 30,
        ),
      ),
    );
  }
}