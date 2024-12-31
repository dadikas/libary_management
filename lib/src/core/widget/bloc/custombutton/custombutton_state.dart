abstract class CustombuttonState {}

class ButtonInitialState extends CustombuttonState {}

class ButtonLoadingState extends CustombuttonState {}

class ButtonSuccessState extends CustombuttonState {}

class ButtonFailureState extends CustombuttonState {
  final String errorMessage;
  ButtonFailureState({required this.errorMessage});
}