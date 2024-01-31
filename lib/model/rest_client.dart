
import 'package:api_testing/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient{

  factory RestClient(Dio dio,{String baseUrl})=_RestClient;

  @GET('users')
  Future<List<User>> getAllUser();

}