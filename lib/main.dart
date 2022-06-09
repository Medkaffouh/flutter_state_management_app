import 'package:flutter/material.dart';
import 'package:flutter_state_management_app/pages/counter.provider.page.dart';
import 'package:flutter_state_management_app/pages/counter.stateful.page.dart';
import 'package:flutter_state_management_app/provider/counter.state.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CounterState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal
        ),
        routes: {
          "/":(context) => CounterProviderPage()
        },
      ),
    );
  }
}

