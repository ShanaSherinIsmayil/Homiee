
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'dart:async';
import 'package:homiee/register.dart';
import 'package:homiee/login.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var option=FirebaseOptions( apiKey: "AIzaSyD00gxfIGk9CEciYEcT-ANQMA1o3mfjtLQ",
  authDomain: "homiee-2d7c2.firebaseapp.com",
  projectId: "homiee-2d7c2",
  storageBucket: "homiee-2d7c2.appspot.com",
  messagingSenderId: "550625309546",
  appId: "1:550625309546:web:c8f66d759b511992d2ab13");
await Firebase.initializeApp(options: option);
  runApp(MaterialApp(home: Login(),));
}

/*class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState()
  {
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1500,));
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Login()));
  }*/
  /*class Splash extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Splash(),  
      debugShowCheckedModeBanner: false,  
    );  
  }  
}  
  
class Splashscreen extends StatefulWidget {  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<Splashscreen> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 5),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => Splash()  
            )  
         )  
    );  
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width:double.infinity ,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/splashscreen.png"),
            fit: BoxFit.cover
          )),
        ),
      ),
    );
  }
}*/

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
        body: Container(
          width:double.infinity ,
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/Login Page.png"),
            fit: BoxFit.fill
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 390,
                ),
                Text("Login as",style: TextStyle(color:Color.fromARGB(255, 11, 11, 11),
            fontSize: 20,
            fontFamily: "Poppins"),),
            SizedBox(
                  height: 20,
                ),
                 GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),);
              },
               child: Container(
                  width: 205,
                  height: 55,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 46, 225, 26),
                  borderRadius: BorderRadius.circular(20)
                
                
                ),
                
                child: Center(
                  child: Text("USER",style: TextStyle(color:Color.fromARGB(255, 252, 249, 249),
                            fontSize: 20,
                            fontFamily: "Poppins"),),
                ),
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 205,
                  height: 55,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 46, 225, 26),
                  borderRadius: BorderRadius.circular(20)
                
                
                ),
                child: Center(
                  child: Text("HOME MAKER",style: TextStyle(color:Color.fromARGB(255, 252, 249, 249),
                            fontSize: 20,
                            fontFamily: "Poppins"),),
                ),
                ),
                SizedBox(
                  height: 40,
                ),
                 Text("Didn't sign up yet?",style: TextStyle(color:Color.fromARGB(255, 11, 11, 11),
            fontSize: 13,
            fontFamily: "Poppins"),),
             SizedBox(
                  height: 20,
                ),
                GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()),);
              },
                child: Container(
                  width: 205,
                  height: 55,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 46, 225, 26),
                  borderRadius: BorderRadius.circular(20)
                
                
                ),
                
                child: Center(
                  child: Text("Sign Up",style: TextStyle(color:Color.fromARGB(255, 252, 249, 249),
                            fontSize: 20,
                            fontFamily: "Poppins"),),
                ),
                
                ),
                )
          
 
              
              ],
            ),
        ),
      ),
    );
  }
}