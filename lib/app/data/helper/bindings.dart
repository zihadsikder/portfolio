import 'package:get/get.dart';
import 'package:portfolio/app/modules/contact/controllers/contact_controller.dart';
import 'package:portfolio/app/modules/main_dashboard/controllers/main_dashboard_controller.dart';
import 'package:portfolio/app/modules/portfolio/controllers/portfolio_controller.dart';
import 'package:portfolio/app/modules/service/controllers/service_controller.dart';

import '../../modules/home/controllers/home_controller.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<PortfolioController>(() => PortfolioController());
    Get.lazyPut<ServiceController>(() => ServiceController());
    Get.lazyPut<MainDashboardController>(() => MainDashboardController());

  }
}