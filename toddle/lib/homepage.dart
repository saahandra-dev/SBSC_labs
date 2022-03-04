import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toddle/add_task_page.dart';
import 'package:toddle/models/task.dart';
import 'package:toddle/widgets/subheader.dart';
import 'widgets/category_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isChecked = false;

  List<Task> tasks = [
    Task(title: 'Buy Oranges', date: '2022')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,

        ),
        leading: Icon(Icons.menu_sharp, color: Colors.black,),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text('What\'s up!',
              style: TextStyle(
                color: Color(0xff020417),
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20.0,),
            SubHeader(subtitle: 'CATEGORIES',),
            SizedBox(height: 20.0,),
            Row(
              children: const [
                CategoryCard(
                  taskTotalNum: '40 tasks',
                  title: 'Business',
                ),
                SizedBox(width: 15.0),
                CategoryCard(
                  taskTotalNum: '18 tasks',
                  title: 'Personal',
                ),
              ],
            ),
            SizedBox(height: 40.0,),
            SubHeader(subtitle: 'TODAY\'S TASK'),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Checkbox(
                        value: tasks[index].isDone,
                        onChanged: (value) {
                          setState(() {
                            tasks[index].toggleDone();
                          });
                        },
                        side: BorderSide(),
                        shape: CircleBorder(),
                      ),
                      title: Text(tasks[index].title,
                        style: TextStyle()
                      ),
                      trailing: SubHeader(subtitle: '',)

                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage())
          );
         },
        child: Icon(Icons.note_add),
      ),
    );
  }
}




