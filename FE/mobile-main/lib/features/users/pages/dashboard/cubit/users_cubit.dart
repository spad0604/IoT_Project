import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_cubit.freezed.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUser) : super(const _Loading());

  int currentPage = 1;
  int lastPage = 1;
  final List<User> users = [];

  final GetUsers _getUser;

  Future<void> refresh() async {
    /// reset data
    users.clear();

    /// reset page
    currentPage = 1;
    lastPage = 1;

    /// fetch data
    await fetchUsers(UsersParams(page: currentPage));
  }

  Future<void> nextPage() async {
    if (currentPage < lastPage) {
      currentPage++;
      await fetchUsers(UsersParams(page: currentPage));
    }
  }

  Future<void> fetchUsers(UsersParams usersParams) async {
    if (currentPage == 1) emit(const _Loading());
    emit(const _Success());

  }
}
