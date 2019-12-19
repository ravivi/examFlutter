import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../db_helper/resto_db.dart';
import '../provider/resto_provider.dart';
import 'package:provider/provider.dart';

class CreateRestoOnline extends StatefulWidget {
  @override
  _CreateRestoOnlineState createState() => _CreateRestoOnlineState();
}

class _CreateRestoOnlineState extends State<CreateRestoOnline> {
  TextEditingController nomController = new TextEditingController();
  TextEditingController photoController = new TextEditingController();
  TextEditingController villeController = new TextEditingController();
  TextEditingController communeController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  TextEditingController sigleController = new TextEditingController();
  TextEditingController numeroController = new TextEditingController();
  Future<void> addResto() async {
    const url = 'http://192.168.50.85:1337/resto';
    try {
      final response = await http.post(url,
          body: json.encode({
            'name': nomController.text.toString(),
            'photo': photoController.text.toString(),
            'cigle': sigleController.text.toString(),
          }));
      print(json.decode(response.body));
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Uint8List _bytesImage;
  File _image;
  String base64Image;

  Future getImage() async {
    var image2 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    List<int> imageBytes = image2.readAsBytesSync();
    print(imageBytes);
    base64Image = base64Encode(imageBytes);
    print('string is');
    print(base64Image);
    print("You selected gallery image : " + image2.path);

    _bytesImage = Base64Decoder().convert(base64Image);

    setState(() {
      _image = image2;
    });
  }

  final resto = Resto_db();
  void initState() {
    resto.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(255, 88, 100, 1),
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                    image: AssetImage("images/resto2.jpg"))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: nomController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.fastfood,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "nom du resto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: photoController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "Photo du resto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: sigleController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.edit,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "Sigle du resto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: villeController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.add_location,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "Ville du resto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 55,
                    width: 300,
                    //margin: EdgeInsets.only(left:30, right:30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                        controller: communeController,
                        style: TextStyle(color: Colors.pink),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.add_location,
                              color: Color.fromRGBO(255, 88, 100, 1),
                            ),
                            hintText: "Commune du resto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 17,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  customButton(context),
                ],
              ),
            )));
  }

  Widget customButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          child: Container(
            width: MediaQuery.of(context).size.height / 4,
            height: 50.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blueAccent, Colors.blueGrey],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    addResto();
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: customText("Valider",
                        size: 20, weight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        // FlatButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Devenir Propriètaire",
        //     style: TextStyle(color:Color.fromRGBO(255, 88, 100, 1), fontWeight: FontWeight.w700),
        //   ),
        // )
      ],
    );
  }

  Widget customText(String data,
      {double size, FontWeight weight, Color color: Colors.white}) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class EditResto extends StatefulWidget {
  @override
  _EditRestoState createState() => _EditRestoState();
}

class _EditRestoState extends State<EditResto> {
  final _sigleFocus = FocusNode();
  final _typeFocus = FocusNode();
  final _numeroFocus = FocusNode();
  final _villeFocus = FocusNode();
  final _communeFocus = FocusNode();

  final _imageController = TextEditingController();
  final _imageFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _editedResto = Resto(
    id: null,
    nom: '',
    photo: '',
    sigle: '',
    tel: '',
    ville: '',
    commune: '',
    type: '',
  );
  var _initValues = {
    'nom': '',
    'photo': '',
    'sigle': '',
    'tel': '',
    'ville': '',
    'commune': '',
    'type': '',
  };
  var _isInit = true;
  var _initLoaded = false;
  @override
  void initState() {
    _imageFocus.addListener(_updateImage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final restoId = ModalRoute.of(context).settings.arguments as String;
      if (restoId != null) {
        _editedResto =
            Provider.of<Restos>(context, listen: false).findById(restoId);
        _initValues = {
          'nom': _editedResto.nom,
          'photo': '',
          'sigle': _editedResto.sigle,
          'tel': _editedResto.tel,
          'ville': _editedResto.ville,
          'commune': _editedResto.commune,
          'type': _editedResto.type,
        };
        _imageController.text = _editedResto.photo;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void dispose() {
    _imageFocus.removeListener(_updateImage);
    _communeFocus.dispose();
    _sigleFocus.dispose();
    _typeFocus.dispose();
    _numeroFocus.dispose();
    _villeFocus.dispose();
    _imageFocus.dispose();
    super.dispose();
  }

  void _updateImage() {
    if (!_imageFocus.hasFocus) {
      if ((!_imageController.text.startsWith('http') &&
              !_imageController.text.startsWith('https')) ||
          (!_imageController.text.endsWith('.png') &&
              !_imageController.text.endsWith('.jpg') &&
              !_imageController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _initLoaded = true;
    });
    if (_editedResto.id != null) {
      Provider.of<Restos>(context, listen: false)
          .updateProduct(_editedResto.id, _editedResto);
      setState(() {
        _initLoaded = false;
      });
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Restos>(context, listen: false)
            .addResto(_editedResto);
      } catch (error) {
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Une Erreur"),
                content: Text("Il s'est produit une erreur"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      } finally {
        setState(() {
          _initLoaded = true;
        });
        Navigator.of(context).pop();
      }
    }
  }
  String base64Image;
  File tmpFile;
  String errorMessage="Une erreur lors de l'upload";
  Future<File> file;
  String status;
  getImage() {
    setState(() {
      file = ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Editer un Resto"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.save),
      //       onPressed: _saveForm,
      //     )
      //   ],
      // ),
      body: _initLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black54, BlendMode.darken),
                      image: AssetImage("images/resto2.jpg"))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      
                      FutureBuilder(
                        future: file,
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            tmpFile = snapshot.data;
                            base64Image = base64Encode(snapshot.data.readAsBytesSync());
                            
                            return Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: FileImage(snapshot.data),
                                maxRadius: 50,
                              ),
                            );
                          }
                          else if(null != snapshot.error){
                            return Text("Une erreur");
                          }
                          else{
                            return Text("Ajouter une image");
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 250,
                            //margin: EdgeInsets.only(left:30, right:30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Container(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              child: TextFormField(
                                initialValue: _initValues['nom'],
                                style: TextStyle(color: Colors.pink),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.fastfood,
                                      color: Color.fromRGBO(255, 88, 100, 1),
                                    ),
                                    hintText: "nom du resto",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      fontSize: 17,
                                    )),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_sigleFocus);
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Ajoutez un nom';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _editedResto = Resto(
                                      nom: value,
                                      sigle: _editedResto.sigle,
                                      tel: _editedResto.tel,
                                      photo: base64Image,
                                      id: _editedResto.id,
                                      ville: _editedResto.ville,
                                      commune: _editedResto.commune,
                                      type: _editedResto.type);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: Icon(FontAwesomeIcons.camera,
                                    color: Color.fromRGBO(255, 88, 100, 0.5)),
                              ))
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: 300,
                        //margin: EdgeInsets.only(left:30, right:30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            initialValue: _initValues['sigle'],
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(255, 88, 100, 1),
                                ),
                                hintText: "Sigle du Resto",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 17,
                                )),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            focusNode: _sigleFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_typeFocus);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Rentrez le sigle";
                              }
                              if (value.length > 5) {
                                return "Pouvez vous Rentrez un sigle inferieur a 5 lettres";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedResto = Resto(
                                  nom: _editedResto.nom,
                                  sigle: value,
                                  tel: _editedResto.tel,
                                  photo: base64Image,
                                  id: _editedResto.id,
                                  ville: _editedResto.ville,
                                  commune: _editedResto.commune,
                                  type: _editedResto.type);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: 300,
                        //margin: EdgeInsets.only(left:30, right:30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            initialValue: _initValues['type'],
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(255, 88, 100, 1),
                                ),
                                hintText: "Type du Resto",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 17,
                                )),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            focusNode: _typeFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_numeroFocus);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Rentrez le Type";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedResto = Resto(
                                  nom: _editedResto.nom,
                                  sigle: _editedResto.sigle,
                                  tel: _editedResto.tel,
                                  photo: base64Image,
                                  id: _editedResto.id,
                                  ville: _editedResto.ville,
                                  commune: _editedResto.commune,
                                  type: value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: 300,
                        //margin: EdgeInsets.only(left:30, right:30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            initialValue: _initValues['tel'],
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.phone,
                                  color: Color.fromRGBO(255, 88, 100, 1),
                                ),
                                hintText: "Numéro du Resto",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 17,
                                )),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            focusNode: _numeroFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_villeFocus);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Rentrez le Numero";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedResto = Resto(
                                  nom: _editedResto.nom,
                                  sigle: _editedResto.sigle,
                                  tel: value,
                                  photo: base64Image,
                                  id: _editedResto.id,
                                  ville: _editedResto.ville,
                                  commune: _editedResto.commune,
                                  type: _editedResto.type);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: 300,
                        //margin: EdgeInsets.only(left:30, right:30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            initialValue: _initValues['ville'],
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.locationArrow,
                                  color: Color.fromRGBO(255, 88, 100, 1),
                                ),
                                hintText: "Ville",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 17,
                                )),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            focusNode: _villeFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_communeFocus);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Rentrez la Ville";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedResto = Resto(
                                  nom: _editedResto.nom,
                                  sigle: _editedResto.sigle,
                                  tel: _editedResto.tel,
                                  photo: base64Image,
                                  id: _editedResto.id,
                                  ville: value,
                                  commune: _editedResto.commune,
                                  type: _editedResto.type);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 55,
                        width: 300,
                        //margin: EdgeInsets.only(left:30, right:30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            initialValue: _initValues['commune'],
                            style: TextStyle(color: Colors.pink),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.add_location,
                                  color: Color.fromRGBO(255, 88, 100, 1),
                                ),
                                hintText: "Ajouter la Commune",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 17,
                                )),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            focusNode: _communeFocus,
                            onFieldSubmitted: (_) {
                              _saveForm();
                              //FocusScope.of(context).requestFocus(_imageFocus);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Rentrez la commune";
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _editedResto = Resto(
                                  nom: _editedResto.nom,
                                  sigle: _editedResto.sigle,
                                  tel: _editedResto.tel,
                                  photo: base64Image,
                                  id: _editedResto.id,
                                  ville: _editedResto.ville,
                                  commune: value,
                                  type: _editedResto.type);
                            },
                          ),
                        ),
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: <Widget>[
                      //     Container(
                      //       height: 100,
                      //       width: 100,
                      //       margin: EdgeInsets.only(top: 10, right: 10),
                      //       child: _imageController.text.isEmpty
                      //           ? CircleAvatar(
                      //               backgroundColor: Colors.white,
                      //             )
                      //           : CircleAvatar(
                      //               backgroundColor: Colors.white,
                      //               backgroundImage:
                      //                   NetworkImage(_imageController.text),
                      //             ),
                      //     ),
                      //     Expanded(
                      //       child: TextFormField(
                      //         decoration: InputDecoration(
                      //             labelText: "Entrez l'url de la photo"),
                      //         keyboardType: TextInputType.url,
                      //         textInputAction: TextInputAction.done,
                      //         controller: _imageController,
                      //         focusNode: _imageFocus,
                      //         validator: (value) {
                      //           if (value.isEmpty) {
                      //             return "Entrez une photo svp ";
                      //           }
                      //           if (!value.startsWith("http") &&
                      //               !value.startsWith("https")) {
                      //             return "Entrez une url";
                      //           }
                      //           // if (!value.endsWith(".jpg") &&
                      //           //     !value.endsWith(".png") &&
                      //           //     !value.endsWith(".jpeg")) {
                      //           //   return "Assurez vous d'ajouter une photo";
                      //           // }
                      //           return null;
                      //         },
                      //         onFieldSubmitted: (_) {
                      //           _saveForm();
                      //         },
                      //         onSaved: (value) {
                      //           _editedResto = Resto(
                      //               nom: _editedResto.nom,
                      //               sigle: _editedResto.sigle,
                      //               tel: _editedResto.tel,
                      //               photo: value,
                      //               id: _editedResto.id,
                      //               ville: _editedResto.ville,
                      //               commune: _editedResto.commune,
                      //               type: _editedResto.type);
                      //         },
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(height: 25),
                      customButton(context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget customButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          child: Container(
            width: MediaQuery.of(context).size.height / 4,
            height: 50.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blueAccent, Colors.blueGrey],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    _saveForm();
                  },
                  child: Center(
                    child: customText("Valider",
                        size: 20, weight: FontWeight.bold),
                  )),
            ),
          ),
        ),
        // FlatButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Devenir Propriètaire",
        //     style: TextStyle(color:Color.fromRGBO(255, 88, 100, 1), fontWeight: FontWeight.w700),
        //   ),
        // )
      ],
    );
  }

  Widget customText(String data,
      {double size, FontWeight weight, Color color: Colors.white}) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
      textAlign: TextAlign.center,
    );
  }
}
