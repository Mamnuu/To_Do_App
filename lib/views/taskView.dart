import 'package:flutter/material.dart';
import 'package:to_do_app/controllers/taskController.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TaskController _todoController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas  ${_todoController.todos.length}', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: _todoController.todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoController.todos[index].taskName),
            subtitle: Text(_todoController.todos[index].description),
            leading: Checkbox(
              value: _todoController.todos[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  _todoController.toggleTaskCompletion(index);
                });
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _showEditTaskDialog(context, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _todoController.deleteTask(index);
                    });
                  },
                ),
              ],
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
                setState(() {
                  _todoController.addTask(newTaskName, newTaskDescription);
                  _todoController.create({'title': 'tarea1'});
                });
                Navigator.pop(context);
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        String newTaskName = _todoController.todos[index].taskName;
        String newTaskDescription = _todoController.todos[index].description;

        return AlertDialog(
          title: Text('Editar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newTaskName = value;
                },
                decoration: InputDecoration(labelText: 'Nombre de la Tarea'),
                controller: TextEditingController(text: newTaskName),
              ),
              TextField(
                onChanged: (value) {
                  newTaskDescription = value;
                },
                decoration:
                    InputDecoration(labelText: 'Descripción de la Tarea'),
                controller: TextEditingController(text: newTaskDescription),
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
                setState(() {
                  _todoController.editTask(index, newTaskName, newTaskDescription);
                });
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
