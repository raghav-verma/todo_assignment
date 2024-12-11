import 'package:get/get.dart';
import '../../models/task_model.dart';


class TodoController extends GetxController {
  final tasks = <Task>[].obs;
  final taskInput = ''.obs;
  final isDarkMode = false.obs;
  final searchTerm = ''.obs;

  void addTask() {
    if (taskInput.value.isNotEmpty) {
      tasks.add(Task(title: taskInput.value));
      taskInput.value = '';
    }
  }

  void toggleTaskCompletion(int index) {
    tasks[index].isComplete = !tasks[index].isComplete;
    tasks.refresh();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  List<Task> get filteredTasks =>
      tasks.where((t) => t.title.toLowerCase().contains(searchTerm.value.toLowerCase())).toList();

  void clearCompletedTasks() {
    tasks.removeWhere((task) => task.isComplete == true);
  }
}
