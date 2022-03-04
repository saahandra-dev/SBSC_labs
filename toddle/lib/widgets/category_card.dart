import 'package:flutter/material.dart';
class CategoryCard extends StatelessWidget {
  final String title;
  final String taskTotalNum;

  const CategoryCard({
    Key? key, required this.title, required this.taskTotalNum
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Color(0xfff4f6fd),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(taskTotalNum,
              style: TextStyle(
                  color: Color(0xff9d9ab4),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 5.0,),
            Text(title,
                style: TextStyle(
                    color: Color(0xff020417),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600
                )
            ),
          ],
        ),
      ),
    );
  }
}