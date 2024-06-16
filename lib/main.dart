// ignore_for_file: prefer_const_constructors

// import 'package:f_firstapp/Page/todo_page.dart';
import 'package:flutter/material.dart';

///////////----------------- For StoringData on local Storage(To Do App)----------///////////////////

import 'package:f_firstapp/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
//initialize the hive

  await Hive.initFlutter();
// open the box
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

///////////////// ----------For DarkMode And Light Mode----------------////////////////
// import 'package:provider/provider.dart';
// import 'package:f_firstapp/theme/theme.dart';
// import 'package:f_firstapp/theme/theme_provider.dart';
// import 'package:f_firstapp/DarkMode/homePage.dart';
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => ThemeProvider(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//       theme: Provider.of<ThemeProvider>(context).themeData,
//     );
//   }
// }

//////////////////--------------For Navigation-------------//////////////////

// import 'package:f_firstapp/pages/first_page.dart';
// import 'package:f_firstapp/pages/second_page.dart';
// void main() {
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FirstPage(),
//       routes: {'/SecondPage': (context) => SecondPage()},
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ToDoPage(),
//     );
//   }
// }

