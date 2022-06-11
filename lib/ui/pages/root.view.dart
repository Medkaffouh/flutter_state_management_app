import 'package:flutter/material.dart';
import 'counter.bloc.page.dart';
import 'counter.statful.page.dart';
import 'git.users.page.dart';
import 'home.page.dart';


class RoutView extends StatelessWidget {
  const RoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //we can personalize our theme like we want in this way:
      theme: ThemeData(
          primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.red,
          )
        )
      ),
      routes: {
        "/":(context) => const HomePage(),
        "/counter1":(context) => const CounterStatefulPage(),
        "/counter2":(context) => const CounterBlocPage(),
        "/users":(context) => const GitUsersPage(),
      },
      initialRoute: "/",
    );
  }
}