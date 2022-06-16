import 'package:bloc/bloc.dart';
import 'package:flutter_state_management_app/model/users.model.dart';
import 'package:flutter_state_management_app/repository/users.repository.dart';

abstract class UsersEvent{}
class SearchUsersEvent extends UsersEvent{
  final String keyword;

  SearchUsersEvent({
    required this.keyword,
  });
}

abstract class UsersState{}
class SearchUsersSuccessState extends UsersState{
  final ListUsers listUsers;

  SearchUsersSuccessState({
    required this.listUsers,
  });
}
class SearchUsersLoadingState extends UsersState{}
class SearchUsersErrorState extends UsersState{
  String errorMessage;

  SearchUsersErrorState({
    required this.errorMessage,
  });
}

class UsersInitialState extends UsersState{}

class UsersBloc extends Bloc<UsersEvent,UsersState>{
  UsersRepository usersRepository=UsersRepository();
  UsersBloc():super(UsersInitialState()){
    on((SearchUsersEvent event, emit) async{
      emit(SearchUsersLoadingState());
      try {
        ListUsers listUsers =await usersRepository.searchUsers(event.keyword, 0, 20);
        emit(SearchUsersSuccessState(listUsers: listUsers));
      } catch (e) {
        emit(SearchUsersErrorState(errorMessage: e.toString()));
      }
    });
  }

}