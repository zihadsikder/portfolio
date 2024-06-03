import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/main_dashboard/controllers/main_dashboard_controller.dart';
import 'package:portfolio/app/data/globals/app_colors.dart';
import 'package:portfolio/app/data/globals/app_text_style.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainDashboardView extends GetView<MainDashboardController> {
  const MainDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      ()=> Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          toolbarHeight: 90,
          titleSpacing: 40,
          elevation: 0,
          title: LayoutBuilder(
            builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Portfolio',style: AppTextStyles.headerTextStyle(),),
                    const Spacer(),
                    if (constraints.maxWidth < 768)
                      PopupMenuButton(
                        icon: Icon(
                          Icons.menu_sharp,
                          size: 32,
                          color: AppColors.white,
                        ),
                        color: AppColors.bgColor2,
                        position: PopupMenuPosition.under,
                        constraints: BoxConstraints.tightFor(width: size.width * 0.9),
                        itemBuilder: (BuildContext context) => controller.menuItems
                            .asMap()
                            .entries
                            .map(
                              (e) => PopupMenuItem(
                            textStyle: AppTextStyles.headerTextStyle(color: AppColors.white),
                            onTap: () => controller.scrollTo(index: e.key),
                            child: Text(e.value),
                          ),
                        )
                            .toList(),
                      )
                    else
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                          itemCount: controller.menuItems.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, child) => const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final isHovering = controller.menuIndex.value == index;
                            return InkWell(
                              onTap: () => controller.scrollTo(index: index),
                              borderRadius: BorderRadius.circular(100),
                              onHover: (value) {
                                if (value) {
                                  controller.menuIndex.value = index;
                                } else {
                                  controller.menuIndex.value = 0;
                                }
                              },
                              child: buildNavBarAnimatedContainer(index, isHovering),
                            );
                          },
                        ),
                      ),
                    const SizedBox(width: 30),
                  ],
                );

            },
          ),
        ),
        body:  Scrollbar(
            controller: controller.scrollController,
            trackVisibility: true,
            thumbVisibility: true,
            thickness: 8,
            interactive: true,
            child: ScrollablePositionedList.builder(
              itemCount: controller.screensList.length,
              itemScrollController: controller.itemScrollController,
              itemPositionsListener: controller.itemPositionsListener,
              itemBuilder: (context, index) {
                return controller.screensList[index];
              },
            ),
          ),

      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? controller.onMenuHover : Matrix4.identity(),
      child: Text(
        controller.menuItems[index],
        style: AppTextStyles.headerTextStyle(
          color: hover ? AppColors.themeColor : AppColors.white,
        ),
      ),
    );
  }
}
