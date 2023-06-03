import 'package:flutter/material.dart';
import 'package:homiee/userform.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                
            SizedBox(
                  height: 20,
                ),
                GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()),);
              },
                
                child:Container(
                  width: 205,
                  height: 55,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 46, 225, 26),
                  borderRadius: BorderRadius.circular(20)
                
                
                ),
                child: Center(
                  child: Text("SIGN UP",style: TextStyle(color:Color.fromARGB(255, 252, 249, 249),
                            fontSize: 20,
                            fontFamily: "Poppins"),),
                ),
                ),),
                SizedBox(
                  height: 20,
                ),
               
                SizedBox(
                  height: 40,
                ),
                 Text("Already have an account?",style: TextStyle(color:Color.fromARGB(255, 11, 11, 11),
            fontSize: 13,
            fontFamily: "Poppins"),),
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
                  child: Text("Login",style: TextStyle(color:Color.fromARGB(255, 252, 249, 249),
                            fontSize: 20,
                            fontFamily: "Poppins"),),
                ),
                
                ),
                
          
 
              
              ],
            ),
        ),
      ),
    );
  }
}