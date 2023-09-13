import 'dart:convert';

import 'package:auth_rest_api/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //fort obsuecureObject show or hidden
  bool obsecureObject = true;

  var emailController = TextEditingController();
  var passController = TextEditingController();
  String userEmail = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login With Rest Api',
            style: TextStyle(fontSize: 21),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xffF02E65)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                border: OutlineInputBorder(),
                labelText: 'Enter Email',
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'Enter Your Email',
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              controller: passController,
              obscureText: obsecureObject,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
                suffixIcon: obsecureObject
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecureObject = !obsecureObject;
                          });
                        },
                        child: Icon(Icons.visibility_off_outlined))
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecureObject = !obsecureObject;
                          });
                        },
                        child: Icon(Icons.visibility_outlined)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color(0xffF02E65)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: 'Enter Password',
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              color: Colors.green,
              child: OutlinedButton(
                  onPressed: () {
                    userEmail = emailController.text.toString();
                    login(emailController.text.toString(),
                        passController.text.toString());
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    ));
  }

  Future<void> login(String email, String password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Account Create successful');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    userEmail: userEmail,
                  )),
        );
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['message'];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Not Valid')));
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
