import 'package:flutter/material.dart';
import '../../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  const TaskTile({
    Key? key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isDone,
        onChanged: (val) => onChanged(),
      ),
      title: Text(task.title),
      subtitle: task.dueDate != null
          ? Text(
        "Due: ${task.dueDate!.toLocal().toString().split(' ')[0]}",
        style: const TextStyle(color: Colors.redAccent),
      )
          : null,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
