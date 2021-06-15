import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/models/todo_model.dart';
import 'package:flutter_sqflite_todos/services/database.dart';
import 'package:intl/intl.dart';

class AddTodoScreen extends StatefulWidget {
  final VoidCallback updateTodos;
  final Todo todo;

  const AddTodoScreen({
    this.updateTodos,
    this.todo,
  });

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController;
  TextEditingController _dateController;
  TextEditingController _descriptionController;

  Todo _todo;

  bool get _isEditing => widget.todo != null;

  @override
  void initState() {
    super.initState();

    if (_isEditing) {
      _todo = widget.todo;
    } else {
      _todo = Todo(
        name: '',
        date: DateTime.now(),
        completed: false,
      );
    }

    _nameController = TextEditingController(text: _todo.name);
    _dateController =
        TextEditingController(text: DateFormat.MMMMEEEEd().format(_todo.date));
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c222e),
        title: Text(!_isEditing ? 'Create Todo' : 'Update Todo'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add a title',
                  style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                
                    ),
                  ),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(fontSize: 16.0),
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      ),
                  ),
                  validator: (value) =>
                      value.trim().isEmpty ? 'Please enter a title' : null,
                  onSaved: (value) => _todo = _todo.copyWith(name: value),
                ),
                const SizedBox(height: 32.0),
                
                const SizedBox(height: 32.0),
                Text('Add a title',
                  style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                    ),
                  ),
                TextFormField(
                  maxLines: 4,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                    ),
                    fillColor: Colors.grey[100],
                    filled: true
                  )
                ),
                const SizedBox(height: 350.0),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     if (_isEditing)
                  Hero(
                    tag: 'Create',
                    child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  
                    width: 80.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        DatabaseService.instance.delete(_todo.id);
                        widget.updateTodos();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(45.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                ),
                    ),
                  ),
                    Hero(
                      tag: 'Create',
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 80.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              primary: !_isEditing ? Colors.green : Colors.green,
                              minimumSize: const Size.fromHeight(45.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Text(
                              !_isEditing ? '+' : '+',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  
                  
                
                // const SizedBox(height: 10.0),
               
              ],
                ),
                ],
                ),
          ),
        ),
      ),
    );
  }

  // Future<void> _handleDatePicker() async {
  //   final date = await showDatePicker(
  //     context: context,
  //     initialDate: _todo!.date,
  //     firstDate: DateTime.now().subtract(const Duration(days: 365)),
  //     lastDate: DateTime.now().add(const Duration(days: 365)),
  //   );
  //   if (date != null) {
  //     _dateController.text = DateFormat.MMMMEEEEd().format(date);
  //     setState(() => _todo = _todo!.copyWith(date: date));
  //   }
  // }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (!_isEditing) {
        DatabaseService.instance.insert(_todo);
      } else {
        DatabaseService.instance.update(_todo);
      }

      widget.updateTodos();

      Navigator.of(context).pop();
    }
  }
}
