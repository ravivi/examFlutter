import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  //  File _imageFile;
  // void _getImage(BuildContext context, ImageSource source) {
  //   ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
  //     setState(() {
  //       _imageFile = image;
  //     });
  //     Navigator.pop(context);
  //   });
  // }

  // void _openImagePicker(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Container(
  //           height: 150.0,
  //           padding: EdgeInsets.all(10.0),
  //           child: Column(children: [
  //             Text(
  //               'Prendre une photo',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 10.0,
  //             ),
  //             FlatButton(
  //               textColor: Theme.of(context).primaryColor,
  //               child: Text('Utilisez la caméra'),
  //               onPressed: () {
  //                 _getImage(context, ImageSource.camera);
  //               },
  //             ),
  //             FlatButton(
  //               textColor: Theme.of(context).primaryColor,
  //               child: Text('Image depuis la galerie'),
  //               onPressed: () {
  //                 _getImage(context, ImageSource.gallery);
  //               },
  //             )
  //           ]),
  //         );
  //       });
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
