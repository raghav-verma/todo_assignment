import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/task_tile.dart';
import '../controllers/todo_controller.dart';
import '../themes/app_theme.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final TextEditingController _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          Obx(() {
            return Row(
              children: [
                const Icon(Icons.dark_mode),
                const SizedBox(width: 8),
                Tooltip(
                  message: themeController.isDark.value
                      ? "Switch to Light Mode"
                      : "Switch to Dark Mode",
                  child: Switch.adaptive(
                    value: themeController.isDark.value,
                    onChanged: (val) {
                      themeController.toggleTheme();
                    },
                  ),
                ),
              ],
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Add a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    controller.addTask(_textController.text);
                    _textController.clear();
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(() {
              return Row(
                children: [
                  const Text('Filter:'),
                  const SizedBox(width: 10),
                  DropdownButton<Filter>(
                    value: controller.filter.value,
                    onChanged: (value) {
                      if (value != null) controller.changeFilter(value);
                    },
                    items: const [
                      DropdownMenuItem(value: Filter.all, child: Text('All')),
                      DropdownMenuItem(value: Filter.completed, child: Text('Completed')),
                      DropdownMenuItem(value: Filter.incomplete, child: Text('Incomplete')),
                    ],
                  ),
                ],
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              final tasks = controller.filteredTasks;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: tasks[index],
                    onChanged: () {
                      controller.toggleTask(index);
                    },
                    onDelete: () {
                      controller.deleteTask(index);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
