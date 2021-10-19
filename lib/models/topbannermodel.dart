
class TopBannerModel{
  final List<String> topImgs;
  final List<Map<String,dynamic>> centerButtonItem;
  final String mainTitle;

  TopBannerModel({
    required this.mainTitle,
    required this.centerButtonItem,
    required this.topImgs,
  });
}