import 'package:flutter/material.dart';
import 'package:gallery_task/src/models/image_model.dart';
import 'package:gallery_task/src/screens/image_fullscreen_view.dart';

class ImageDetailView extends StatelessWidget {
  final ImageModel image;

  ImageDetailView({
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.image.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Text('Author: ${image.author}',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.headline,
            ),

            SizedBox(height: 10,),
            
            Container(
                child: GestureDetector(
                  child: Image.network(image.regular),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => ImageFullScreenView(
                        url: image.url,
                      )
                    ));
                  },
                )
              ),

              SizedBox(height: 10,),

              Text(image.description ?? '',
                textAlign: TextAlign.justify,
              ),
          ],),
        ),
      ),
    );
  }
}