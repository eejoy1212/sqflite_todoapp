import 'package:flutter/material.dart';
import 'package:sqflite_todoapp_test/screens/categories_screen.dart';
import 'package:sqflite_todoapp_test/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1504006833117-8886a355efbf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
              ),
            ),
            accountName: Text('이원희'),
            accountEmail: Text('eejoy1212@gmail.com'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Categories'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesScreen())),
          )
        ],
      ),
    ));
  }
}
