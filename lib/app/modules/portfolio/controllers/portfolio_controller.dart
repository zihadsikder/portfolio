import 'package:get/get.dart';

import '../../../data/globals/app_assets.dart';

class PortfolioController extends GetxController {
  final projects = [
    {
      'image': AppAssets.work1,
      'title': 'Blood BD App',
      'description':
          '	Designed an intuitive UI for smooth usage.'
          '	Number OTP Verification when user registration.'
          '	Easily find a Donor by area base.'
          '	Using call or message system in Donor Card.'
          '	Automatic ID Deactivate for next 4 month when user added Donation History.'
          '	ID Activate/Deactivate system.'
          '	Important Govt. Service Added.'
          '	Easily update account.'
          '	Exercise & Diet Chart for a Donor.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
    {
      'image': AppAssets.work2,
      'title': 'Web Design',
      'description': 'Description for Web Design project.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
    {
      'image': AppAssets.work1,
      'title': 'Graphic Design',
      'description': 'Description for Graphic Design project.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
    {
      'image': AppAssets.work2,
      'title': 'SEO Optimization',
      'description': 'Description for SEO Optimization project.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
    {
      'image': AppAssets.work1,
      'title': 'Content Writing',
      'description': 'Description for Content Writing project.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
    {
      'image': AppAssets.work2,
      'title': 'Social Media Marketing',
      'description': 'Description for Social Media Marketing project.',
      'shareIcon': AppAssets.share,
      'link': 'https://blooddonorbd.com'
      // Add the specific share icon for this project
    },
  ].obs;

  // Reactive hoveredIndex
  var hoveredIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
