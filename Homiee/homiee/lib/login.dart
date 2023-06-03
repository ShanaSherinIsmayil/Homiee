import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homiee/auth.dart';
import 'package:homiee/validator.dart';
import 'package:homiee/userhome.dart';
import 'package:homiee/userform.dart';

class LoginScreen extends StatefulWidget {
@override
_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

final _emailTextController = TextEditingController();
final _passwordTextController = TextEditingController();

final _focusEmail = FocusNode();
final _focusPassword = FocusNode();

bool _isProcessing = false;

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          user: user,
        ),
      ),
    );
  }

  return firebaseApp;
}

@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      _focusEmail.unfocus();
      _focusPassword.unfocus();
    },
    child: Scaffold(
      
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width:double.infinity ,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/Login Page.png"),
            fit: BoxFit.fill
            )),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0,top: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0,top: 12),
                      ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                          ),
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
                          SizedBox(height: 8.0),
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
                          SizedBox(height: 24.0),
                          _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                   onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();
            
                                    if (_formKey.currentState!
                                        .validate()) {
                                      setState(() {
                                        _isProcessing = true;
                                      });
            
                                      User? user = await FirebaseAuthHelper
                                          .signInUsingEmailPassword(
                                        email: _emailTextController.text,
                                        password:
                                            _passwordTextController.text,
                                      );
            setState(() {
                                        _isProcessing = false;
                                      });
            
                                      if (user != null) {
                                        Navigator.of(context)
                                            .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen(user: user),
                                          ),
                                        );
                                        }
                                    }
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 42, 226, 25)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 24.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                     Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 70, 202, 26)),
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
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      ),
  );
}
}