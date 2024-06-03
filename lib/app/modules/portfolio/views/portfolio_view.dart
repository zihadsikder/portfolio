import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../../../data/globals/app_colors.dart';
import '../../../data/globals/app_text_style.dart';
import '../../../data/helper/helper_class.dart';
import '../controllers/portfolio_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioView extends GetView<PortfolioController> {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          const SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
         const SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          const SizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }


  FadeInRight buildProjectText() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: controller.projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        return Obx(() {
          var project = controller.projects[index];
          return FadeInUpBig(
            duration: const Duration(milliseconds: 1600),
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                if (value) {
                  controller.hoveredIndex.value = index;
                } else {
                  controller.hoveredIndex.value = -1;
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(project['image'] as String),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: index == controller.hoveredIndex.value,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.themeColor.withOpacity(1.0),
                            AppColors.themeColor.withOpacity(0.9),
                            AppColors.themeColor.withOpacity(0.8),
                            AppColors.themeColor.withOpacity(0.6),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            project['title'] as String,
                            style: AppTextStyles.montserratStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        SizedBox(
                            height: 130, // Adjust this height as needed
                            child: SingleChildScrollView(
                              child: Text(
                                project['description'] as String,
                                style: AppTextStyles.normalStyle(
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          CircleAvatar(
                            maxRadius: 25,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Image.asset(
                                project['shareIcon'] as String,
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                              onPressed: () async {
                                final url = project['link'] as String;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
