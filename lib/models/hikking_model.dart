class HikingModel {
  final int id;
  final String imagePath;
  final String title;
  final String intro;
  final String desc;
  final Geo? location;
  bool isFavorited;
  List<HikingImgModel> images;

  HikingModel({
    required this.id,
    required this.desc,
    required this.imagePath,
    required this.images,
    required this.intro,
    this.isFavorited = false,
    this.location,
    required this.title,
  });
}

class Geo {
  final double lat;
  final double long;

  Geo({
    required this.lat,
    required this.long,
  });
}

class HikingImgModel {
  final String imageUrl;

  HikingImgModel(this.imageUrl);
}
