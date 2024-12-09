import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReqParams);
}


