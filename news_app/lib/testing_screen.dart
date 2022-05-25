import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_jcikwtux.json',
        ),
      ),
    );
  }
}
