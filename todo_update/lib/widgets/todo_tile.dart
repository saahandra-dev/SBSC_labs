import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/models/todo_model.dart';
import 'package:flutter_sqflite_todos/screens/add_todo.dart';
import 'package:flutter_sqflite_todos/services/database.dart';
import 'package:intl/intl.dart';


class TodoTile extends StatelessWidget {
  final VoidCallback updateTodos;
  final Todo todo;

  const TodoTile({
    required this.updateTodos,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final completedTextDecoration =
        !todo.completed ? TextDecoration.none : TextDecoration.lineThrough;
    return ListTile(
      key: Key(todo.id.toString()),
      title: Text(
        todo.name,
        style: TextStyle(
          fontSize: 18.0,
          decoration: completedTextDecoration,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            '${DateFormat.MMMMEEEEd().format(todo.date)} ',
            style: TextStyle(
              height: 1.3,
              decoration: completedTextDecoration,
            ),
          ),
        ],
      ),
      trailing: Checkbox(
        value: todo.completed,
        activeColor: Colors.orange,
        onChanged: (value) {
          DatabaseService.instance.update(todo.copyWith(completed: value));
          updateTodos();
        },
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => AddTodoScreen(
            updateTodos: updateTodos,
            todo: todo,
          ),
        ),
      ),
    );
  }
}
