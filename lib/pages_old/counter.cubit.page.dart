import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_app/bloc_old/counter.cubit.dart';
import 'package:flutter_state_management_app/provider/counter.state.dart';
import 'package:provider/provider.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build .....");
    return Scaffold(
      appBar: AppBar(title: Text('Counter Cubit'),),
      body: BlocBuilder<CounterCubit,int>(
        builder: (context,state){
          return Center(
            child: Text('Counter Value => $state',style: Theme.of(context).textTheme.headline4,),
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
                context.read<CounterCubit>().decrement();
              }
          ),
          SizedBox(width: 4,),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                context.read<CounterCubit>().increment();
              }
          )
        ],
      ),
    );
  }
}