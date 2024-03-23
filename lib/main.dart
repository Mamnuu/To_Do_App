import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  List<String> taskDescriptions = [];
  List<bool> taskCompleted = [];

  void _addTask(String taskName, String description) {
    setState(() {
      tasks.add(taskName);
      taskDescriptions.add(description);
      taskCompleted.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            subtitle: Text(taskDescriptions[index]),
            leading: Checkbox(
              value: taskCompleted[index],
              onChanged: (value) {
                setState(() {
                  taskCompleted[index] =
                      value!; 
                });
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String newTaskName = '';
        String newTaskDescription = ''; 

        return AlertDialog(
          title: Text('Agregar Nueva Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newTaskName = value;
                },
                decoration: InputDecoration(labelText: 'Nombre de la Tarea'),
              ),
              TextField(
                onChanged: (value) {
                  newTaskDescription = value; 
                },
                decoration:
                    InputDecoration(labelText: 'Descripción de la Tarea'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _addTask(newTaskName,
                    newTaskDescription); 
                Navigator.pop(context); 
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
