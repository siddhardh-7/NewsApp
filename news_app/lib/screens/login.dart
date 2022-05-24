import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utilities/colors.dart';

import '../utilities/dimensions.dart';

class Login extends StatefulWidget {
  static String id = 'Login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 2 * Dimensions.padding20,
                  vertical: 2 * Dimensions.padding20),
              child: Lottie.network(
                'https://assets8.lottiefiles.com/packages/lf20_mjlh3hcy.json',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.padding20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor1,
                    ),
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor2,
                    ),
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius12),
                  ),
                  hintText: "Email",
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.padding20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor1,
                    ),
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainColor2,
                    ),
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius12),
                  ),
                  hintText: "password",
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            GestureDetector(
              onTap: signIn,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(Dimensions.padding20),
                margin: EdgeInsets.all(Dimensions.padding20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.mainColor1,
                      AppColors.mainColor2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius5),
                ),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('Sign Up ?'))
          ],
        ),
      ),
    ));
  }
}
