import 'package:flutter/material.dart';
import 'package:gallery_task/src/screens/images_list_view.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagesListView(),
      theme: ThemeData.dark(),
    );
  }
}
