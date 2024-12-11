class TaskModel {
  String title;
  bool isDone;
  DateTime? dueDate;

  TaskModel({required this.title, this.isDone = false, this.dueDate});
}
