import 'package:flutter/material.dart';
import '../model/image_models.dart';

class ImageList extends StatelessWidget{

  final List<ImageModel> imageModelList;

  @override
   Widget build(context) {

    return ListView.builder(
      itemCount: imageModelList.length,
      itemBuilder: (context, int index){
        return buildImage(imageModelList[index]);
      }
    );
  }



  Widget buildImage(ImageModel image){
    return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey)
        ),
        child: Column (
          children: <Widget>[
            Image.network(image.url),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0
              ),
                child: Text(image.title)
            )
          ]
        )
    );
  }



  ImageList(this.imageModelList);


}