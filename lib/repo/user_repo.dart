import 'package:api_testing/exceptions/network_exceptions.dart';
import 'package:api_testing/model/rest_client.dart';
import 'package:api_testing/model/user.dart';
import 'package:api_testing/repo/api_result.dart';

class UserRepo {
  final RestClient client;

  UserRepo({required this.client});

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      final response = await client.getAllUser();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
