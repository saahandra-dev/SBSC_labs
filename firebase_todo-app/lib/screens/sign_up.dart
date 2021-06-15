
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_todos/screens/log_in.dart';
import 'package:flutter_sqflite_todos/screens/todo_list.dart';
import 'package:flutter_sqflite_todos/widgets/reusableTextField.dart';


class SignIn extends StatefulWidget {
  // const SignIn({ }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ba9d1),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
          Container(
            width: double.infinity,
            height: 400.0,
            decoration: BoxDecoration(
              color: Color(0xff4ba9d1),
             
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: Colors.white,
              ),
            ),
          )
        ],),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            height: 500.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
            
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign up',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                    )
                  ),
                  SizedBox(height: 60.0),
                  ReusableTextField(
                    icon: Icon(Icons.person,
                    color: Colors.lightBlue,
                    ), 
                    hint: 'Name'),
                  SizedBox(height: 10.0,),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    // autofocus: true,
                    decoration: InputDecoration(  
                      prefixIcon: Icon(Icons.lock,
                      color: Colors.lightBlue,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue)
                      ),
                      )
                    ),
                  SizedBox(height: 10.0,),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    // autofocus: true,
                    decoration: InputDecoration(  
                      prefixIcon: Icon(Icons.lock,
                      color: Colors.lightBlue,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue)
                      ),
                      )
                    ),
                    SizedBox(height: 40.0,),
                  Hero(
                    tag: 'button',
                    child: ElevatedButton(
                      onPressed: () async{
                        try {
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if (newUser != null) {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TodoListScreen()
                        ),
                         );
                      } 
                      } catch (e) {
                        // print(e);
                      }
                      },
                      
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff122138),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            //padding: 20.0
                          )
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Align(
                    alignment: Alignment.bottomRight,
                    child: Text('Have an account?')),
                    SizedBox(width: 5.0,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()
                      ),
                       );
                       },
                      child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('Log In',
                      style: TextStyle(
                        // textBaseline: ,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold )
                      )),
                    )

                  ],)
                  
                  

              ],),
            ),
          ),
        )
        ]
      )
      
    );
  }
}

