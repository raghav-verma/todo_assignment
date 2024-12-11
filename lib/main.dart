import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/todo_binding.dart';
import 'app/themes/app_theme.dart';
import 'app/views/todo_view.dart';


void main() {
  Get.put<ThemeController>(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: TodoBinding(),
        home: const TodoView(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.theme,
      );
    });
  }
}
