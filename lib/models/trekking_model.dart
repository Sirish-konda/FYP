class TrekkingModel {
  final int id;
  final String imagePath;
  final String title;
  final String intro;
  final String desc;
  final Geo? location;

  List<TrekkingImgModel> images;

  TrekkingModel({
    required this.intro,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.desc,
    required this.images,
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

class TrekkingImgModel {
  final String imageUrl;

  TrekkingImgModel(this.imageUrl);
}
