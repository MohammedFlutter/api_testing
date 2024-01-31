// import 'package:api_testing/repo/user_repo.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// import 'model/user.dart';
//
// part 'user_state.dart';
//
// class UserCubit extends Cubit<UserState> {
//   UserCubit({
//     required this.userRepo,
//   }) : super(UserInitial());
//   final UserRepo userRepo;
//
//   void emitGetAllUsers() {
//     userRepo.getAllUsers().then((apiResult) => apiResult.when(
//         success: (users) => emit(UserLoaded(users: users), failure:(networkException)=> emit() )));
//   }
// }
