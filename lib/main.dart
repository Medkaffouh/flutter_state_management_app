import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_app/bloc_old/counter.cubit.dart';
import 'package:flutter_state_management_app/pages_old/counter.cubit.page.dart';
import 'package:flutter_state_management_app/pages_old//counter.provider.page.dart';
import 'package:flutter_state_management_app/pages_old//counter.stateful.page.dart';
import 'package:flutter_state_management_app/provider/counter.state.dart';
import 'package:flutter_state_management_app/ui/pages/counter.bloc.page.dart';
import 'package:flutter_state_management_app/ui/pages/counter.statful.page.dart';
import 'package:flutter_state_management_app/ui/pages/git.users.page.dart';
import 'package:flutter_state_management_app/ui/pages/home.page.dart';
import 'package:provider/provider.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RoutView();
  }
}

class RoutView extends StatelessWidget {
  const RoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
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







// Provider State Management
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

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