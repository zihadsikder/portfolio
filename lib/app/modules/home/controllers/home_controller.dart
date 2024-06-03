import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart'; // Import path_provider package
import '../../../data/globals/app_assets.dart';

class HomeController extends GetxController {
  final socialButtons = <String>[
    AppAssets.facebook,
    //AppAssets.twitter,
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.github,
  ].obs;


  // Define social account URLs
  final socialUrls = <String>[
    'https://www.facebook.com/zihad.sikder.cse?mibextid=ZbWKwL',
    //'https://twitter.com/your_twitter_username',
    'https://www.linkedin.com/in/zihad-sikder-722b5029a/',
    'https://www.instagram.com/asmsikder?igsh=MTJsbjlza3Y3enZ5Yw==',
    'https://github.com/zihadsikder',
  ];

  final socialBI = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> downloadCV() async {
    try {
      final url = 'https://drive.google.com/file/d/1aa3DKp356xsLvii8AHPYYxJ-T3EqYT2Z/view?usp=sharing';
      final request = await HttpClient().getUrl(Uri.parse(url));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final dir = await getApplicationDocumentsDirectory(); // Use getApplicationDocumentsDirectory here
      final file = File('${dir.path}/https://drive.google.com/file/d/1aa3DKp356xsLvii8AHPYYxJ-T3EqYT2Z/view?usp=sharing');
      await file.writeAsBytes(bytes);
      // Show a success message or open the file
    } catch (e) {
      // Handle errors
    }
  }

  void viewCV() async {
    final dir = await getApplicationDocumentsDirectory(); // Use getApplicationDocumentsDirectory here
    final file = File('${dir.path}/https://drive.google.com/file/d/1aa3DKp356xsLvii8AHPYYxJ-T3EqYT2Z/view?usp=sharing');
    final url = file.path;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
