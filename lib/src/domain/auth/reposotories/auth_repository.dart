import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  // Future<void> signIn(String email, String password);
  Future<Either> signup(SignupReqParams signupReqParams);
  // Future<void> signOut();
}