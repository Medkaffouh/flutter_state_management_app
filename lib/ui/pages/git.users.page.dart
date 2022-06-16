import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_app/bloc/users.bloc.dart';

import '../widgets/main.drawer.widget.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Git Users"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 2,
                      )
                    )
                  ),
                )),
                IconButton(
                    onPressed: (){
                      String kw=textEditingController.text;
                      context.read<UsersBloc>().add(SearchUsersEvent(keyword: kw));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          )
        ],
      ),
    );
  }
}
