import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninReqParams signinReqParams);
  Future<Either> signup(SignupReqParams signupReqParams);
  Future<bool> isLoggedIn();
  
}