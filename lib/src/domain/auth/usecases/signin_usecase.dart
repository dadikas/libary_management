import 'package:fpdart/fpdart.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/core/usecase/usecase.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';

class SigninUscase extends Usecase<Either, SigninReqParams>{
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}