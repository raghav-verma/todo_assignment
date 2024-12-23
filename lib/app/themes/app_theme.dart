import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;
  ThemeMode get theme => isDark.value ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    isDark.value = !isDark.value;
  }
}
