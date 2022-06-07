class OnBoardingModel {
  String? imageUrl;
  String? title;
  String? subtitle;

  OnBoardingModel({this.imageUrl, this.subtitle, this.title});

  OnBoardingModel.fromJson(json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
}
