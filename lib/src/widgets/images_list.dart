import 'package:flutter/material.dart';
import 'package:gallery_task/src/screens/image_detail_view.dart';
import '../models/image_model.dart';
import 'image_card.dart';


class ImagesList extends StatelessWidget {

  ImagesList({@required this.images});

  final List<ImageModel> images;

  @override
  Widget build(BuildContext context) {
    int len = images.length;
    return ListView.builder(
      itemCount: len,
      itemBuilder: (context, int i) {
        return GestureDetector(
          child: buildImage(images[i], i),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => ImageDetailView(
                image: images[i]
              )
            ));
          },
        );
      },
    );
  }

  Widget buildImage(ImageModel image, int index) {
    return ImageCard(
      children: <Widget>[
        Flexible(
          child: Column(
            children: <Widget>[
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(bottom: 10),
              child: Image.network(image.thumb),
            ),
            
            Text('Name: ${image.name}',
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 10,),
            
            Text('Author: ${image.author}',
              textAlign: TextAlign.justify,
            ),
          ],),
        ),
      ],
    );
  }
}
