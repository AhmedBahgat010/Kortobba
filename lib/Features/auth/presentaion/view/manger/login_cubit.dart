import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final loginRepository = AuthRepository();

  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login() async {
    try {

      final formData = getFormData();
      if (formData == null) return;

      emit(LoginLoading());

      await loginRepository.login(
        username: formData['username'] ?? "",
        password: formData['password'] ?? "",
      );

      emit(LoginSuccess());
    } catch (error) {
      String errorMessage = error.toString();
      if (error is DioError) {
        final response = error.response;
        if (response != null && response.statusCode == 401) {
          // Customize the error message for 401 status code
          errorMessage = "No active account found with the given credentials";
        }
      }

      emit(LoginError(errorMessage));
    }
  }

  Map<String, dynamic>? getFormData() {
    final formState = formKey.currentState;

    if (formState == null) return null;
    if (formState.saveAndValidate() == false) return null;

    return formState.value;
  }
}
