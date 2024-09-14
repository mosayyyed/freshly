class ContentModel {
  final String image;
  final String title;
  final String description;

  ContentModel(
      {required this.image, required this.title, required this.description});
}

List<ContentModel> contents = [
  ContentModel(
    image: 'Assets/images/onboarding1.png',
    title: 'Food You Love',
    description: 'Choose your favorite recipe and cook \n at home.',
  ),
  ContentModel(
    image: 'Assets/images/onboarding2.png',
    title: 'Delivered To You',
    description: 'Get your groceries home as fast as you want.',
  ),
  ContentModel(
    image: 'Assets/images/onboarding3.png',
    title: 'So You Can Enjoy',
    description:
        'This way you can enjoy fresh cooked food at your home with your loved ones.',
  ),
];
