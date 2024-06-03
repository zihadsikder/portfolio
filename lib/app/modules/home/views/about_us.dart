import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import '../../../data/globals/app_assets.dart';
import '../../../data/globals/app_buttons.dart';
import '../../../data/globals/app_colors.dart';
import '../../../data/globals/app_text_style.dart';
import '../../../data/helper/helper_class.dart';


class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          const SizedBox(height: 35.0),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          const SizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          const SizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.profile2,
        height: 450,
        width: 400,
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Me!',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'
                ' The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,'
                ' as opposed to using \'Content here, content here\', making it look like readable English.'
                ' Many desktop publishing packages and web page editors now use Lorem Ipsum as their default'
                ' model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.'
                ' Various versions have evolved over the years, sometimes by accident, sometimes on purpose'
                ' (injected humour and the like).',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        const SizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {}, buttonName: 'Read More'),
        )
      ],
    );
  }
}
