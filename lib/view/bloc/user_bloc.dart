import 'package:cleva_test/data/repository/user_repositoy_u.dart';
import 'package:cleva_test/view/bloc/user_event.dart';
import 'package:cleva_test/view/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepoU repository;

  UserBloc({required this.repository}) : super(UserInitial()) {
    on<FetchUsers>(
      (event, emit) async {
        emit(UserLoading());
        try {
          final users = await repository.getUsers();
          emit(UserLoaded(users));
        } catch (e) {
          emit(UserError(e.toString()));
        }
      },
    );
  }
}
