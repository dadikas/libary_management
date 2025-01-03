import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReqParams);
  Future<Either> signin(SigninReqParams signinReqParams);
}


