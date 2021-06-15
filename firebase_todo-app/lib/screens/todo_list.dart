// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/models/todo_model.dart';
import 'package:flutter_sqflite_todos/screens/add_todo.dart';
import 'package:flutter_sqflite_todos/screens/log_in.dart';
import 'package:flutter_sqflite_todos/screens/sign_up.dart';
import 'package:flutter_sqflite_todos/services/database.dart';
import 'package:flutter_sqflite_todos/widgets/todo_tile.dart';
import 'package:flutter_sqflite_todos/widgets/todos_overview.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _getTodos();
    getCurrentUser();
  }

  Future<void> _getTodos() async {
    final todos = await DatabaseService.instance.getAllTodos();
    if (mounted) {
      setState(() => _todos = todos);
    }
  }

  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  

  // @override
  // void initState() {
  //   super.initState();
    
  // }

  Future<void> getCurrentUser() async {
    try {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    } 
    }catch(e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c222e),
        title: Text(''),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff4ba9d1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
            
              children: [
                SizedBox(height: 40.0,),
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/images/todo_profile.jpeg'),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(loggedInUser.email.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                  )
                  )
                  ),
                  SizedBox(height: 40.0,),
                Row(
                  children: [
                    Icon(Icons.logout,
                    color: Colors.white,
                    ),
                    SizedBox(width: 10.0,),
                    InkWell(
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                     ); },
                      child: Text('Sign out',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white
                      ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
              )
            ,
          ),
      
   
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          itemCount: 1 + _todos.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return TodosOverview(todos: _todos);
            final todo = _todos[index - 1];
            return TodoTile(
              updateTodos: _getTodos,
              todo: todo,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Create',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => AddTodoScreen(updateTodos: _getTodos),
          ),
        ),
        backgroundColor: Color(0xff1c222e),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: const Icon(Icons.add,
        size: 35.0,
        
        ),
      ),
    );
  }
}
