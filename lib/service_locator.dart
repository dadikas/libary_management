import 'package:get_it/get_it.dart';
import 'package:libary_management/src/core/network/dio_client.dart';
import 'package:libary_management/src/data/auth/repositories/auth_repository_imp.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service.dart';
import 'package:libary_management/src/data/auth/sources/auth_api_service_imp.dart';
import 'package:libary_management/src/domain/auth/repositories/auth_repository.dart';
import 'package:libary_management/src/domain/auth/usecases/is_logged_in.dart';
import 'package:libary_management/src/domain/auth/usecases/signin_usecase.dart';
import 'package:libary_management/src/domain/auth/usecases/signup_uscase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImp());

  //UseCases
  sl.registerSingleton<SigninUscase>(SigninUscase());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  
  sl.registerSingleton<IsLoggedIn>(IsLoggedIn());
}