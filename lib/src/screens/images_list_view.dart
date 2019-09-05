import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/images_list.dart';

import '../models/image_model.dart';


class ImagesListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagesListViewState();
  }
}


class ImagesListViewState extends State<ImagesListView> {

  int counter = 0;
  List<ImageModel> images = [];
  Future<List<ImageModel>> futureImages;
  bool isLoading = false;

  getContent(String url) async {
    http.Response resp = await http.get(url, headers: {'Content-Type':'application/json'});
    Uint8List body = resp.bodyBytes;
    var content = json.decode(utf8.decode(body));

    return content;
  } 

  Future<List<ImageModel>> fetchImages() async{
    final String url = 'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
    List<dynamic> content = await getContent(url);
    List<ImageModel> images = List<ImageModel>.generate(content.length, (int i) => ImageModel.fromJson(content[i]));

    return images;
  }

  @override
  void initState() {
    futureImages = fetchImages();
    
    super.initState();
  }  
  
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: FutureBuilder(
        future: futureImages,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
            
              images = snapshot.data;
              counter = images.length;
              return Column(children: <Widget>[
                SizedBox(height: statusBarHeight,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '$counter images uploaded',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),

                Expanded(child: ImagesList(images: images),),
                isLoading ? Padding(
                  child: CircularProgressIndicator(), 
                  padding: EdgeInsets.symmetric(vertical: 7),) : Container(),
              ],);
          }
        }// child: 
      ) 
    );
  }
}