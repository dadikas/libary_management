
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:libary_management/src/core/widget/bloc/custombutton/custombutton_state.dart';

class CustomButtonCubit extends Cubit<CustombuttonState> {
  CustomButtonCubit() : super(ButtonInitialState());

  Future<void> execute(Function asyncFunction) async {
    emit(ButtonLoadingState());
    try {
      Either result = await asyncFunction();
      result.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        }
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}