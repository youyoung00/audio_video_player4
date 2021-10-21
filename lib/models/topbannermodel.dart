

class TopBannerModel{
   List<String> topImgs;
   List<Map<String,dynamic>> topBannerButtons;
   String mainTitle;

  TopBannerModel({
    required this.mainTitle,
    required this.topBannerButtons,
    required this.topImgs,
  });
}
