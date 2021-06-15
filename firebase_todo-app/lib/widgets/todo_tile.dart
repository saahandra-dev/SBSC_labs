import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/models/todo_model.dart';
import 'package:flutter_sqflite_todos/screens/add_todo.dart';
import 'package:flutter_sqflite_todos/services/database.dart';
import 'package:intl/intl.dart';


class TodoTile extends StatelessWidget {
  final VoidCallback updateTodos;
  final Todo todo;

  const TodoTile({
    this.updateTodos,
    this.todo,
  });

  @override
  Widget build(BuildContext context) {
    final completedTextDecoration =
        !todo.completed ? TextDecoration.none : TextDecoration.lineThrough;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListTile(
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
          activeColor: Color(0xff4ba9d1),
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
      ),
    );
  }
}
