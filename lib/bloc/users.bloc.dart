import 'package:bloc/bloc.dart';

abstract class UsersEvent{}
class SearchUsersEvent extends UsersEvent{
  final String keyword;

  SearchUsersEvent({
    required this.keyword,
  });
}

abstract class UsersState{}
class SearchUsersSuccessState extends UsersState{}
class SearchUsersLoadingState extends UsersState{}
class SearchUsersErrorState extends UsersState{}

class UsersInitialState extends UsersState{}

class UsersBloc extends Bloc<UsersEvent,UsersState>{
  UsersBloc():super(UsersInitialState()){
    on((SearchUsersEvent event, emit){
      print("******* Bloc Event processing");
      print(event);
      print(event.keyword);
      print("=============================");
    });
  }

}