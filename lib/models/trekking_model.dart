class TrekkingModel {
  final int id;
  final String imagePath;
  final String title;
  final String desc;
  bool isFavorited;
  List<TrekkingImgModel> images;

  TrekkingModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.desc,
    this.isFavorited = false,
    required this.images,
  });
}

class TrekkingImgModel {
  final String imageUrl;

  TrekkingImgModel(this.imageUrl);
}
