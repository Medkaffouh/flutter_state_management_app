import 'package:flutter/material.dart';

import '../widgets/main.drawer.widget.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Bloc"),),
      body: Center(
        child: Text("Counter Bloc",style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}
