import 'package:get/get.dart';

import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main_dashboard/bindings/main_dashboard_binding.dart';
import '../modules/main_dashboard/views/main_dashboard_view.dart';
import '../modules/portfolio/bindings/portfolio_binding.dart';
import '../modules/portfolio/views/portfolio_view.dart';
import '../modules/service/bindings/service_binding.dart';
import '../modules/service/views/service_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_DASHBOARD,
      page: () => const MainDashboardView(),
      binding: MainDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PORTFOLIO,
      page: () => PortfolioView(),
      binding: PortfolioBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () =>  ServiceView(),
      binding: ServiceBinding(),
    ),
  ];
}
