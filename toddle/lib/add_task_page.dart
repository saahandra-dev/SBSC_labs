import 'package:flutter/material.dart';
import 'package:toddle/homepage.dart';
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xffe8e8e8),
                      width: 2.0,
                    )
                  ),
                  child: InkWell(

                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear, size: 25.0,)
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xff020417),
                  fontWeight: FontWeight.w500
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your task',
                  hintStyle: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xff9d9ab4)
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Homepage()
                    )
                    );
                  },
                  child: Text('New task',),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    fixedSize: Size(150.0, 50.0),
                    textStyle: TextStyle(
                      fontSize: 18.0
                    )
                  )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
