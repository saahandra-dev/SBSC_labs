import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
   ReusableTextField({
   this.hint, this.icon, this.onChanged,
  });

  final icon;
  final hint; 
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText: true,
      // autofocus: true,
      decoration: InputDecoration(  
        prefixIcon: icon,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue)
        ),
        )
      );
  }
}