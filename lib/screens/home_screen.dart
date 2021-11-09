import 'package:flutter/material.dart';
import 'package:sqflite_todoapp_test/helpers/drawer_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To_do_List sqflite'),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
