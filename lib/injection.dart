import 'package:api_testing/cubit/users_cubit.dart';
import 'package:api_testing/model/rest_client.dart';
import 'package:api_testing/repo/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<UsersCubit>(() => UsersCubit(userRepo: getIt()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(client: getIt()));
  getIt.registerLazySingleton<RestClient>(() => RestClient(createDio()));
}

Dio createDio() {
  final dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..options.sendTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
      error: true,
      responseBody: true,
      requestBody: true,
      requestHeader: false,
      responseHeader: false,
      request: true));

  return dio;
}
