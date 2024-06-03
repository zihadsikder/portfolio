import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';


import '../../../data/globals/app_buttons.dart';
import '../../../data/globals/app_colors.dart';
import '../../../data/globals/app_text_style.dart';
import '../../../data/helper/helper_class.dart';
import '../controllers/home_controller.dart';
import 'widgets/profile_animation.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
          () => HelperClass(
        mobile: Column(
          children: [
            buildHomePersonalInfo(size),
            const SizedBox(height: 25.0),
            const ProfileAnimation(),
          ],
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: buildHomePersonalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        paddingWidth: size.width * 0.1,
        bgColor: AppColors.bgColor,
      ),
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Abu Sayed MD. Zihad',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle: AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText(
                    'Freelancer',
                    textStyle: AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            width: size.width * 0.5,
            child: Text(
              'In publishing and graphic design, Lorem ipsum is a placeholder'
                  ' text commonly used to demonstrate the visual form of a document'
                  ' or a typeface without relying on meaningful content.',
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        const SizedBox(height: 22),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: controller.socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  onHover: (value) {
                    if (value) {
                      controller.socialBI.value = index;
                    } else {
                      controller.socialBI.value = -1;
                    }
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                    asset: controller.socialButtons[index],
                    hover: controller.socialBI.value == index,
                    url: controller.socialUrls[index],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 18),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: Row(
            children: [
              AppButtons.buildMaterialButton(
                onTap: () async {
                  // Download CV
                  await controller.downloadCV();
                },
                buttonName: 'Download CV',
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // View CV
                  controller.viewCV();
                },
                child: Text(
                  'View CV',
                  style: TextStyle(
                    color: AppColors.themeColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InkWell buildSocialButton({required String asset, required bool hover, required String url}) {
    return InkWell(
      onTap: () {
        launch(url);
      },
      borderRadius: BorderRadius.circular(550.0),
      hoverColor: AppColors.themeColor,
      splashColor: AppColors.lawGreen,
      child: Ink(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.themeColor, width: 2.0),
          color: AppColors.bgColor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: Image.asset(
          asset,
          width: 10,
          height: 12,
          color: hover ? AppColors.bgColor : AppColors.themeColor,
        ),
      ),
    );
  }
}
