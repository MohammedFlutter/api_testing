import 'package:api_testing/cubit/result_state.dart';
import 'package:api_testing/model/user.dart';
import 'package:api_testing/repo/user_repo.dart';
import 'package:bloc/bloc.dart';

class UsersCubit extends Cubit<ResultState<List<User>>> {
  UsersCubit({required this.userRepo}) : super(const ResultState.initial());
  final UserRepo userRepo;

  void getAllUser() {
    userRepo.getAllUsers().then((result) => result.when(
        success: (users) => emit(ResultState.loaded(users)),
        failure: (networkException) =>
            emit(ResultState.error(networkException))));
  }
}
