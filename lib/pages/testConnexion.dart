import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Connection extends StatefulWidget {
  @override
  _ConnectionState createState() => _ConnectionState();
  @override
  initState(){

    
  }
  }

class _ConnectionState extends State<Connection> {
  showalert(BuildContext context, String content){
      return showDialog(
           context: context,
           builder: (BuildContext context){
             return AlertDialog(
               title: Text("Connection"),
               content: Text(content),
               actions: <Widget>[
                 FlatButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text("Ok"),
                 ),
               ],
             );
           }

         );
    }
@override
  void initState() {
      checkConnectivity();
    super.initState();
  }
  checkConnectivity() async{
       var result = await Connectivity().checkConnectivity();

       if(result == ConnectivityResult.none){
         Navigator.popAndPushNamed(context, 'nav');
        
       } else{
         Navigator.popAndPushNamed(context, 'online');
       }

     }
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(

      body: Center(child: RaisedButton(
        onPressed: (){
          
        },

        child: Text("Voir la connexion"),
      ),),
      
    );
    
      }
}