

class ImageModel {
  String id;
  String name;
  String thumb;
  String url;
  String regular;
  String description;
  String author;

  ImageModel({
    this.id,
    this.name,
    this.thumb,
    this.url,
    this.regular,
    this.description,
    this.author,
  });

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['alt_description'] ?? id;
    thumb = parsedJson['urls']['thumb'];
    url = parsedJson['urls']['full'];
    regular = parsedJson['urls']['regular'];
    description = parsedJson['description'];
    author = parsedJson['user']['name'];
  }
}