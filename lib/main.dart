import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Pages/Home_Page.dart';
import 'Pages/Search_Page.dart';
import 'Pages/Categories_Page.dart';
import 'Pages/navigation.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(const MyApp());
}
  class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainNavigationPage(),


    );
  }
  }


/*

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

 */

