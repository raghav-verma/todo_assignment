import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/controllers/todo_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: BindingsBuilder(() {
        Get.put(TodoController());
      }),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
