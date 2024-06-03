import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/helper/bindings.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      initialBinding: IntBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return PageStorage(
          bucket: bucket,
          child: child!,
        );
      },
    );
  }
}
