
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:homiee/userhome.dart';
import 'package:homiee/validator.dart';
import 'package:homiee/auth.dart';

class SignUpScreen extends StatefulWidget {
@override
_SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final _registerFormKey = GlobalKey<FormState>();
final _nameTextController = TextEditingController();
final _emailTextController = TextEditingController();
final _passwordTextController = TextEditingController();

final _focusName = FocusNode();
final _focusEmail = FocusNode();
final _focusPassword = FocusNode();

bool _isProcessing = false;

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      _focusName.unfocus();
      _focusEmail.unfocus();
       _focusPassword.unfocus();
    },
    child: Scaffold(
      body: Container(
        width:double.infinity ,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/Login Page.png"),
            fit: BoxFit.fill
            )),
  
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:250
                        ),
                        TextFormField(
                          controller: _nameTextController,
                          focusNode: _focusName,
                          validator: (value) => Validator.validateName(
                            name: value,
                          ),
                          decoration: InputDecoration(
                             hintText: "Name",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 39, 236, 28),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          decoration: InputDecoration(
                             hintText: "Email",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          ),
                        SizedBox(height: 32.0),
                        _isProcessing
                        ? CircularProgressIndicator()
                        : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isProcessing = true;
                                  });
                                  if (_registerFormKey.currentState!
                                      .validate()) {
                                    User? user = await FirebaseAuthHelper
                                        .registerUsingEmailPassword(
                                      name: _nameTextController.text,
                                      email: _emailTextController.text,
                                      password:
                                      _passwordTextController.text,
                                    );
              
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                     if (user != null) {
                                      Navigator.of(context)
                                          .pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(user: user),
                                        ),
                                        ModalRoute.withName('/'),
                                      );
                                    }
                                  }else{
                                    setState(() {
                                      _isProcessing = false;
                                       });
                                  }
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 12, 218, 29)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}

 

