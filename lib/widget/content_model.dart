class ContentModel{
  String title;
  String description;
  String photo;
  ContentModel({required this.title , required this.description , required this.photo});
}

List<ContentModel> content = [
  ContentModel(
      title: "Unlimited entertainment, one low price",
    description: "Stream on your phone, tablet, laptop, TV and more.",
    photo: "img/Onboarding1.png",
  ),
  ContentModel(
    title: "Watch everywhere",
    description: "Everything on Shivik,starting at just \$XX.",
    photo: "img/Onboarding2.png",
  ),
  ContentModel(
    title: "Unlimited Fun",
    description: "Popular movies and web series,just a click away.",
    photo: "img/OnBoarding3.png",
  ),
  ContentModel(
    title: "Be lazy with shivik",
    description: "Stream anything from your comfort zone",
    photo: "img/OnBoarding4.png",
  ),
];