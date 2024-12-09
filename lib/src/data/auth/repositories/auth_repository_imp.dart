import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service.dart';
import 'package:libary_management/src/domain/auth/reposotories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthApiService authApiService;

  AuthRepositoryImp({required this.authApiService});

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    return await authApiService.signup(signupReqParams);
  }

  
}