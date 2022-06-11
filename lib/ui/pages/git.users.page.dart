import 'package:flutter/material.dart';

import '../widgets/main.drawer.widget.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Git Users"),),
      body: Center(
        child: Text("Git Users",style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}
