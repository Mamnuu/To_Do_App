import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task.dart';

class TaskController {
  List<Task> _tasks = [];

  List<Task> get todos => _tasks;

  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'tasks';

  Future<String> create(Map<String, dynamic> task) async {
    DocumentReference response = await db.collection(collection).add(task);
    return response.id;
  }

  void addTask(String taskName, String description) {
    _tasks.add(Task(taskName, description, false));
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
  }

  void editTask(int index, String taskName, String description) {
    _tasks[index].taskName = taskName;
    _tasks[index].description = description;
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
