import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/loginController.dart';

class Uploadimage extends StatefulWidget {
  Uploadimage({Key key}) : super(key: key);

  @override
  _UploadimageState createState() => _UploadimageState();
}

class _UploadimageState extends StateMVC<Uploadimage> {
  LoginController _imageController = LoginController();
  _UploadimageState() : super(LoginController());

  File _regpic;
  final picker = ImagePicker();

  Future<File> file;

  _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _regpic = File(pickedFile.path);
    });
    // return _imageController.recievedPhoto(_regpic, context);
  }

  @override
  void initState() {
    this._getImage();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
