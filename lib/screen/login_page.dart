import 'package:csv_test/home_screen.dart';
import 'package:csv_test/home_screen_scout.dart';
import 'package:csv_test/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          loginFunc(
                              emailController.text, passwordController.text);
                        },
                        child: Text("Login")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const RegisterPageScreen()),
                        ),
                      );
                    },
                    child: Text("Create Account"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginFunc(String emailInp, String passwordInp) async {
    if (emailInp == "adminaascout@gmail.com") {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailInp, password: passwordInp);
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const HomeScreen())));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailInp, password: passwordInp);
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const HomeScreenScout())));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
