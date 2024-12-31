import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/core/usecase/usecase.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';

class IsLoggedIn extends Usecase<bool, dynamic>{
  
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}