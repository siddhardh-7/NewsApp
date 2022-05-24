import 'package:flutter/material.dart';
import 'package:news_app/utilities/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Center(
          child: Text('T I M E L I N E'),
        ),
        backgroundColor: AppColors.blackshade3,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor1,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Serach'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }
}
