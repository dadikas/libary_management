import 'package:fpdart/fpdart.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/core/usecase/usecase.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';

class SignupUsecase extends Usecase<Either, SignupReqParams>{
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}