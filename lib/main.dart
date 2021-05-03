import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

bool validateEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(email)) ? false : true;
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formkey = GlobalKey<FormState>(); 
  final validated = true;
  void validate(){
    if(formkey.currentState.validate()) {
      print("That works");
    } else { print("Nahh, that's not it");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in',
      theme: ThemeData(
        primaryColor: Colors.tealAccent,
        backgroundColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Scaffold(backgroundColor: Color(0xff121421),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              ),),
              SizedBox(height:60),
              Text("WELCOME BACK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                letterSpacing: 2,
              ),),
              SizedBox(height:15),
            Form( 
              key: formkey,
              child:Column(
              children: [
                TextFormField( 
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      hintText: "Email address",
                      labelStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        fillColor: Colors.white,
                        filled: true
                    ),
                    //validator: (input) => input.isEmail() ? null : "Enter a valid Email address"
                    validator: (input) => validateEmail(input) ? () => this.validate() : "Enter a valid Email address"
              ),
              
            SizedBox(height:15),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  hintText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    fillColor: Colors.white,
                    filled: true
                ),
                validator: (value) {
                if(value.isEmpty) {
                  return "Please enter your password";
                } else {
                  return null;
                }}
              ),
            ],),
            ),
            SizedBox(height: 20),
                  SizedBox(
                    width: 415,
                    height: 50,
                    child: RaisedButton(
                      onPressed: validate,
                      color: Color(0xff1d3863),
                      child: Text("Sign In",
                      style: TextStyle(
                        fontSize: 20,
                        color: validated ? Colors.white: Colors.white,
                      )),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                      ),
                    ),
                  ),
                  SizedBox(height:15),
                  Text("Forgot Password?",
              style: TextStyle(
                color: Colors.white,
              ),),
              SizedBox(height:5),
              Text("Reset Password",
              style: TextStyle(
                color: Color(0xff4A80F0),
              ),),
            ],),
        )
      ),
    );
  }
}