import 'package:flutter/material.dart';
import 'package:flutter_state_management_app/pages/counter.stateful.page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      routes: {
        "/":(context) => CounterPage()
      },
    );
  }
}

