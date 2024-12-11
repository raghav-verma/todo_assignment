import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../themes/app_theme.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TodoController>(TodoController());
    Get.put<ThemeController>(ThemeController());
  }
}
