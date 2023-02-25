class TrekkingModel {
  final int id;
  final String imagePath;
  final String title;
  final String intro;
  final String desc;

  List<TrekkingImgModel> images;

  TrekkingModel({
    required this.intro,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.desc,
    required this.images,
  });
}

class TrekkingImgModel {
  final String imageUrl;

  TrekkingImgModel(this.imageUrl);
}
