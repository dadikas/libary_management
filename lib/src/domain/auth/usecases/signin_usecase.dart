import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/core/usecase/usecase.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/domain/auth/reposotories/auth_repository.dart';

class SigninUsecase extends Usecase<Either, SignupReqParams>{
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await authRepository.signup(params!);
  }
}