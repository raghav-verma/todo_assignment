import 'package:flutter/material.dart';

import '../../models/task_model.dart';


class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onChanged;

  const TaskTile({super.key, required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isComplete,
        onChanged: (value) => onChanged(),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isComplete ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
