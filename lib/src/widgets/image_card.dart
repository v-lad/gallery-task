import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final List<Widget> children;

  ImageCard({@required this.children});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: this.children,
          ),
        ],
      ),
    );
  }
}