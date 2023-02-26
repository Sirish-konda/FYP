class HeritageModel {
  final int id;
  final String imagePath;
  final String desc;
  final String title;
  final String intro;
  final Geo? location;
  List<HeritageImgModel> images;

  HeritageModel({
    required this.id,
    required this.title,
    required this.intro,
    required this.desc,
    required this.images,
    required this.imagePath,
    this.location,
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

class HeritageImgModel {
  final String imageUrl;

  HeritageImgModel(this.imageUrl);
}
