import 'package:bloc/bloc.dart';
import 'package:flutter_state_management_app/model/users.model.dart';
import 'package:flutter_state_management_app/repository/users.repository.dart';

abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent {
  final String keyword;
  final int page;
  final int pageSize;

  SearchUsersEvent({
    required this.keyword,
    required this.page,
    required this.pageSize,
  });
}

class NextPageEvent extends UsersEvent {
  final String keyword;
  final int page;
  final int pageSize;
  NextPageEvent({
    required this.keyword,
    required this.page,
    required this.pageSize
  });
}

abstract class UsersState {
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final String currentKeyword;

  const UsersState({
    required this.users,
    required this.currentPage,
    required this.totalPages,
    required this.pageSize,
    required this.currentKeyword,
  });
}

class SearchUsersSuccessState extends UsersState {
  SearchUsersSuccessState(
      {required List<User> users,
      required int currentPage,
      required int totalPages,
      required int pageSize,
      required String currentKeyword})
      : super(
            users: users,
            totalPages: totalPages,
            currentPage: currentPage,
            pageSize: pageSize,
            currentKeyword: currentKeyword);
}

class SearchUsersLoadingState extends UsersState {
  SearchUsersLoadingState(
      {required List<User> users,
      required int currentPage,
      required int totalPages,
      required int pageSize,
      required String currentKeyword})
      : super(
            users: users,
            currentKeyword: currentKeyword,
            pageSize: pageSize,
            currentPage: currentPage,
            totalPages: totalPages);
}

class SearchUsersErrorState extends UsersState {
  String errorMessage;

  SearchUsersErrorState(
      {required List<User> users,
      required int currentPage,
      required int totalPages,
      required int pageSize,
      required String currentKeyword,
      required this.errorMessage})
      : super(
            totalPages: totalPages,
            currentPage: currentPage,
            pageSize: pageSize,
            currentKeyword: currentKeyword,
            users: users);
}

class UsersInitialState extends UsersState {
  UsersInitialState()
      : super(
            users: [],
            totalPages: 0,
            currentPage: 0,
            pageSize: 20,
            currentKeyword: "");
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersRepository usersRepository = UsersRepository();
  late UsersEvent currentEvent;
  UsersBloc() : super(UsersInitialState()) {
    on((SearchUsersEvent event, emit) async {
      currentEvent=event;
      emit(SearchUsersLoadingState(
        currentKeyword: state.currentKeyword,
        pageSize: state.pageSize,
        currentPage: state.currentPage,
        totalPages: state.totalPages,
        users: state.users,
      ));
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }
        emit(SearchUsersSuccessState(
          users: listUsers.items,
          totalPages: totalPages,
          pageSize: event.pageSize,
          currentPage: event.page,
          currentKeyword: event.keyword,
        ));
      } catch (e) {
        emit(SearchUsersErrorState(
          currentKeyword: state.currentKeyword,
          currentPage: state.currentPage,
          pageSize: state.pageSize,
          totalPages: state.totalPages,
          users: state.users,
          errorMessage: e.toString(),
        ));
      }
    });

    on((NextPageEvent event, emit) async {
      currentEvent=event;
      print("Next Page ${event.page}");
      try {
        ListUsers listUsers = await usersRepository.searchUsers(
            event.keyword, event.page, event.pageSize);
        int totalPages = (listUsers.totalCount / event.pageSize).floor();
        if (listUsers.totalCount % event.pageSize != 0) {
          totalPages = totalPages + 1;
        }
        List<User> currentList = [...state.users];
        currentList.addAll(listUsers.items);
        emit(SearchUsersSuccessState(
          users: currentList,
          totalPages: totalPages,
          pageSize: event.pageSize,
          currentPage: event.page,
          currentKeyword: event.keyword,
        ));
      } catch (e) {
        emit(SearchUsersErrorState(
          currentKeyword: state.currentKeyword,
          currentPage: state.currentPage,
          pageSize: state.pageSize,
          totalPages: state.totalPages,
          users: state.users,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
