import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../data/repositories/auth_repository.dart';
part 'login_state.dart';

// Cubit class for managing the state of the login screen
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // Instance of the authentication repository for handling login-related operations
  final loginRepository = AuthRepository();

  // GlobalKey for accessing the form state
  final formKey = GlobalKey<FormBuilderState>();

  // Method to handle the login process
  Future<void> login() async {
    try {
      // Retrieve form data from the form
      final formData = getFormData();
      if (formData == null) return;

      // Emit the loading state
      emit(LoginLoading());

      // Perform the login operation using the repository
      await loginRepository.login(
        username: formData['username'] ?? "",
        password: formData['password'] ?? "",
      );

      // Emit the success state after a successful login
      emit(LoginSuccess());
    } catch (error) {
      // Handle errors, particularly DioError in this case
      if (error is DioError) {
        final response = error.response;
        print(response!.data);
        emit(LoginError(response.data["detail"].toString()));
      }
    }
  }

  // Method to retrieve and validate form data
  Map<String, dynamic>? getFormData() {
    final formState = formKey.currentState;

    if (formState == null) return null;
    if (formState.saveAndValidate() == false) return null;

    return formState.value;
  }
}
