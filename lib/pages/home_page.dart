import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo17/service/firebase_auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  Future<void> register({required String email, required String pass})async{
    if(email.length> 5 && pass.length>5){
      User? user = await AuthService.registerUser(context, fullName: "fullName", email: email, password: pass);
      if(user != null){
        log("user registered");
      }else{
        log("user not register, something went wrong");
      }
    }

    emailC.clear();
    passC.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                    hintText: "Email"
                ),
              ),

              SizedBox(height: 10),


              TextField(
                controller: passC,
                decoration: InputDecoration(
                   hintText: "Pass"
                ),
              ),

              SizedBox(height: 50),

              MaterialButton(
                minWidth: double.infinity,
                onPressed: ()async{
                  await register(email: emailC.text, pass: passC.text);

                },
                shape: StadiumBorder(side: BorderSide(color: Colors.black)),
              child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
