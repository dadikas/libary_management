import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libary_management/src/core/widget/bloc/custombutton/custombutton_cubit.dart';
import 'package:libary_management/src/core/widget/bloc/custombutton/custombutton_state.dart';


class CustomButton extends StatelessWidget {
  final Future Function() onPressed;
  final String ? title;
  final double ? height;
  final double ? width;
  final Color ? activeColor;
  final VoidCallback onSuccess;
  final Function(String error) onFailure;
  const CustomButton({
    required this.onPressed,
    required this.onSuccess,
    required this.onFailure,
    this.title,
    this.height,
    this.width,
    this.activeColor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomButtonCubit(),
      child: BlocConsumer < CustomButtonCubit, CustombuttonState > (
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            onSuccess();
          } else if (state is ButtonFailureState) {
            onFailure(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ButtonLoadingState) {
            return _loading(context);
          }
          return _initial(context);
        },

      ),
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60
        ),
      ),
      child: const CircularProgressIndicator(color: Colors.white, )
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        context.read<CustomButtonCubit>().execute(onPressed);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor ?? const Color.fromARGB(255, 32, 32, 32),
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60
        ),
      ),
      child: Text(
        title ?? 'Submit',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }
}