import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/image_models.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  @override
   createState() {
    return AppState();
  }


}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> imageModelList = [];

  void fetchImage() async{
    counter ++;
    var url = "https://jsonplaceholder.typicode.com/photos/$counter";

    var response = await get(url) ;
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      imageModelList.add(imageModel);
    });


  }


  @override
  Widget build(context) {

    var app = MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Hello"),
                backgroundColor: Colors.green,
                leading: Icon(Icons.arrow_back)
            ),
            body: ImageList(imageModelList),
            floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
          onPressed: (){
              setState(() {
                fetchImage();
              });

          }
        )
        )
    );

    return app;
  }


}