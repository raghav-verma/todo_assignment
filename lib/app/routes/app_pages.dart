import 'package:get/get.dart';
import '../views/todo_view.dart';

class AppPages {
  static const String initial = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => TodoView(),
    ),
  ];
}
