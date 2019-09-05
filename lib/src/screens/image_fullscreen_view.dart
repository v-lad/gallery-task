import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullScreenView extends StatelessWidget {
  final String url;

  ImageFullScreenView({
    @required this.url
  });
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
      children: <Widget>[
          Container(
            child: PhotoView(
              imageProvider: NetworkImage(this.url),
              minScale: PhotoViewComputedScale.contained * 0.5,
              maxScale: PhotoViewComputedScale.covered * 1.8,
              initialScale: PhotoViewComputedScale.contained,
            )
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.cyan.withAlpha(0x00),
            )
          ),
        ]
      )
    );
  }
}