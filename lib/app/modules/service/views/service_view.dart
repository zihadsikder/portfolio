import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio/app/data/helper/helper_class.dart';

import '../../../data/globals/app_assets.dart';
import '../../../data/globals/app_buttons.dart';
import '../../../data/globals/app_colors.dart';
import '../../../data/globals/app_text_style.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  ServiceView({Key? key}) : super(key: key);

  final ValueNotifier<bool> isAppNotifier = ValueNotifier(false);
  final ValueNotifier<bool> isGraphicNotifier = ValueNotifier(false);
  final ValueNotifier<bool> isDataAnalystNotifier = ValueNotifier(false);

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: buildServicesColumn(),
      tablet: buildServicesColumn(),
      desktop: buildServicesColumn(),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildServicesColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildMyServiceText(),
        const SizedBox(height: 30.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildHoverableContainer(
                title: 'App Development',
                asset: AppAssets.code,
                notifier: isAppNotifier,
              ),
              const SizedBox(width: 24.0),
              buildHoverableContainer(
                title: 'Graphic Designing',
                asset: AppAssets.brush,
                notifier: isGraphicNotifier,
              ),
              const SizedBox(width: 24.0),
              buildHoverableContainer(
                title: 'Digital Marketing',
                asset: AppAssets.analyst,
                notifier: isDataAnalystNotifier,
              ),
            ],
          ),
        ),
      ],
    );
  }

  FadeInRight buildMyServiceText() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Our ',
          style: AppTextStyles.headingStyles(fontSize: 30),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHoverableContainer({
    required String title,
    required String asset,
    required ValueNotifier<bool> notifier,
  }) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        notifier.value = value;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: notifier,
        builder: (context, hover, child) {
          return buildAnimatedContainer(
            title: title,
            asset: asset,
            hover: hover,
          );
        },
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    double width = 300,
    double hoverWidth = 310,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 370 : 350,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border: hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              asset,
              width: 50,
              height: 50,
              color: AppColors.themeColor,
            ),
            const SizedBox(height: 20.0),
            Text(
              title,
              style: AppTextStyles.montserratStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. '
                  'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
              style: AppTextStyles.normalStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            AppButtons.buildMaterialButton(buttonName: 'Read More', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
