import 'package:to_do_app/models/task.dart';

class TaskController {
  List<Task> _tasks = [];

  List<Task> get todos => _tasks;

  void addTask(String taskName, String description) {
    _tasks.add(Task(taskName, description, false));
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}