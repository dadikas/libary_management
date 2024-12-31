import 'package:fpdart/fpdart.dart';
import 'package:libary_management/service_locator.dart';
import 'package:libary_management/src/data/auth/models/signin_req_params.dart';
import 'package:libary_management/src/data/auth/models/signup_req_params.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImp extends AuthRepository {

  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    var data = await sl<AuthApiService>().signup(signupReqParams);
    return data.fold((error){
      return Left(error);
    }, 
      (data) async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['accessToken']);
        return Right(data);
      }
    );
  }
  
  @override
  Future<Either> signin(SigninReqParams signinReqParams) async{
     var data = await sl<AuthApiService>().signin(signinReqParams);
    return data.fold((error){
      return Left(error);
    }, 
      (data) async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['accessToken']);
        return Right(data);
      }
    );
  }
  @override
  Future<bool> isLoggedIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if(token != null){
      return true;
    }
    return false;
  }
 
}