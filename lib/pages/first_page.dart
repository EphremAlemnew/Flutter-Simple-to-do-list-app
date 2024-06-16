// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:f_firstapp/pages/home_page.dart';
import 'package:f_firstapp/pages/second_page.dart';
import 'package:flutter/material.dart';

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedPageIndex = 0;

  final List pages = [HomePage(), SecondPage(), HomePage()];

  void navigateBottomBar(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          onTap: navigateBottomBar,
          items: [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
            //settings
          ]),

      drawer: Drawer(
        backgroundColor: Colors.deepOrange[100],
        child: Column(children: [
          // header
          DrawerHeader(
              child: Icon(
            Icons.school,
            size: 48,
          )),
          // homepage
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/SecondPage');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('SETTINGS'),
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('FEEDBACKS'),
          )
          // setting page
        ]),
      ),
      // body: Center(
      //     child: ElevatedButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/SecondPage');
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) => SecondPage(),
      //     //     ));
      //   },
      //   child: Text('Goto Second page'),
      // )),
    );
  }
}
