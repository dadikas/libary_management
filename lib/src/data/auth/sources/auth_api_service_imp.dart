import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/core/constant/api_url.dart';
import 'package:libary_management/src/core/network/dio_client.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service.dart';
class AuthApiServiceImpl implements AuthApiService {

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    try{
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: signupReqParams.toJson(),
      );
      return Right(response.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
}