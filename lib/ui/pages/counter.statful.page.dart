import 'package:flutter/material.dart';

import '../widgets/main.drawer.widget.dart';

class CounterStatefulPage extends StatelessWidget {
  const CounterStatefulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building widgets tree");
    int counter=0;
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Stateful"),),
      body: Center(
        child: Text("Counter Value => $counter",style: Theme.of(context).textTheme.headline3,),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: (){
              --counter;
              print("counter value $counter");
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: null,
            onPressed: (){
              ++counter;
              print("counter value $counter");
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
