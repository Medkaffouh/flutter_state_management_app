import 'package:flutter/material.dart';
import 'package:flutter_state_management_app/provider/counter.state.dart';
import 'package:provider/provider.dart';

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterState counterState = Provider.of<CounterState>(context,listen: false);
    print("Build .....");
    return Scaffold(
      appBar: AppBar(title: Text('Counter Provider'),),
      body: Consumer<CounterState>(
        builder: (context,counterState,child){
          print("Text ....");
          return Center(
            child: Text('Counter Value => ${counterState.counter}',style: Theme.of(context).textTheme.headline4,),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
                //Provider.of<CounterState>(context,listen: false).decrement();
                counterState.decrement();
              }
          ),
          SizedBox(width: 4,),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                counterState.increment();
              }
          )
        ],
      ),
    );
  }
}