import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_event.dart';
import 'package:libary_management/src/presentation/splash/bloc/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(DisplaySplash()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isFirstTime = await _checkIfFirstTime();
    final bool isLoggedIn = await _checkIfLoggedIn();

    if (isFirstTime) {
      emit(TheFistYouOpenApp());
    } else if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

  Future<bool> _checkIfFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isFirstTime = prefs.getBool('is_first_time');
    if (isFirstTime == null || isFirstTime) {
      await prefs.setBool('is_first_time', false);
      return true;
    }
    return false;
  }

  Future<bool> _checkIfLoggedIn() async {
    return Future.value(false);
  }
}
