import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

const kstyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 30,
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
File file;
void pickImage() async{
  PickedFile pickedFile =await ImagePicker().getImage(source: ImageSource.gallery);
  file = File(pickedFile.path);
  setState(() {

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Picker',
          style: TextStyle(fontSize: 25),
        ),
      ),
     body:file == null? Center(
       child: Text(
         'Select this icon to add Image',
         style: kstyle,
       ),
     ): Center(child: Image.file(file)),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: Icon(Icons.camera_alt,size: 25,),
      ),
    );
  }
}
