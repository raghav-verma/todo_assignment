import 'package:get/get.dart';
import '../../models/task_model.dart';
import 'package:flutter/material.dart';

enum Filter { all, completed, incomplete }

class TodoController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var filter = Filter.all.obs;


  void addTask(String title) {
    final inputText = title.trim();


    if (inputText.isEmpty) {
      Get.snackbar(
        "Error",
        "Task title cannot be empty.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (inputText.length < 3) {
      Get.snackbar(
        "Error",
        "Task title must be at least 3 characters long.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }


    tasks.add(TaskModel(title: inputText));


    Get.snackbar(
      "Success",
      "Task added successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void toggleTask(int index) {
    var task = tasks[index];
    task.isDone = !task.isDone;
    tasks[index] = task;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void changeFilter(Filter newFilter) {
    filter.value = newFilter;
  }

  List<TaskModel> get filteredTasks {
    switch (filter.value) {
      case Filter.completed:
        return tasks.where((t) => t.isDone).toList();
      case Filter.incomplete:
        return tasks.where((t) => !t.isDone).toList();
      default:
        return tasks.toList();
    }
  }
}
