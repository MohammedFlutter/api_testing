// part of 'users_cubit.dart';

import 'package:api_testing/exceptions/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.initial() = _Initial<T>;
  const factory ResultState.loading()=_Loading<T>;
  const factory ResultState.loaded(T data)=_Loaded<T>;
  const factory ResultState.error(NetworkExceptions networkExceptions)=_Error<T>;
}
