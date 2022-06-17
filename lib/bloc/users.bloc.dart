import 'package:bloc/bloc.dart';
import 'package:flutter_state_management_app/model/users.model.dart';
import 'package:flutter_state_management_app/repository/users.repository.dart';

abstract class UsersEvent{}
class SearchUsersEvent extends UsersEvent{
  final String keyword;
  final int page;
  final int pageSize;

  SearchUsersEvent({
    required this.keyword,
    required this.page,
    required this.pageSize,
  });
}

abstract class UsersState{}
class SearchUsersSuccessState extends UsersState{
  final ListUsers listUsers;
  final int currentPage;
  final int totalPages;
  final int pageSize;

  SearchUsersSuccessState({
    required this.listUsers,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
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
        ListUsers listUsers =await usersRepository.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPages=(listUsers.totalCount/event.pageSize).floor();
        if(listUsers.totalCount % event.pageSize != 0) totalPages = totalPages+1;
        emit(SearchUsersSuccessState(
            listUsers: listUsers,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentPage: event.page
        ));
      } catch (e) {
        emit(SearchUsersErrorState(errorMessage: e.toString()));
      }
    });
  }

}