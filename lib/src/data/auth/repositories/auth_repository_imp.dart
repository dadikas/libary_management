import 'package:fpdart/fpdart.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    return await sl<AuthApiService>().signup(signupReqParams);
  }
  
  @override
  Future<Either> signin(SigninReqParams signinReqParams) async{
     return await sl<AuthApiService>().signin(signinReqParams);
  }
 
}