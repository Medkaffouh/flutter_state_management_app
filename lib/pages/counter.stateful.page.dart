import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    print("Build .......");
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Text('Counter Value => $counter',style: Theme.of(context).textTheme.headline4,),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                setState((){
                  --counter;
                });
              }
          ),
          SizedBox(width: 4,),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                setState((){
                  ++counter;
                });
              }
          )
        ],
      ),
    );
  }
}