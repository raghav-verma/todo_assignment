import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../components/task_tile.dart';

class TodoView extends StatelessWidget {
  TodoView({super.key});
  final TodoController controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => controller.searchTerm.value = value,
          decoration: const InputDecoration(
            hintText: 'Search tasks...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 1) {
                controller.toggleTheme();
              } else if (value == 2) {
                controller.clearCompletedTasks();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Toggle Theme'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Clear Completed'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.filteredTasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: controller.filteredTasks[index],
                  onChanged: () => controller.toggleTaskCompletion(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              String newTask = '';
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) => newTask = value,
                      decoration: const InputDecoration(
                        hintText: 'Enter task title',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        controller.taskInput.value = newTask;
                        controller.addTask();
                        Navigator.pop(context);
                      },
                      child: const Text('Add Task'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
