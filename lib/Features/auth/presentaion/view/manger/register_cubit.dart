import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_state.dart';
import '../../../data/repositories/auth_repository.dart';

// Cubit class for managing the state of the register screen
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  // Instance of the authentication repository for handling registration-related operations
  final registerRepository = AuthRepository();

  // GlobalKey for accessing the form state
  final formKey = GlobalKey<FormBuilderState>();

  // Method to handle the registration process
  Future<void> register() async {
    try {
      // Retrieve form data from the form
      final formData = getFormData();
      if (formData == null) return;

      // Emit the loading state
      emit(RegisterLoading());

      // Perform the registration operation using the repository
      await registerRepository.register(
        username: formData['username'] ?? "",
        password: formData['password'] ?? "",
        lastName: formData['lastname'] ?? "",
        email: formData['email'] ?? "",
        firstName: formData['firstname'] ?? "",
      );

      // Emit the success state after a successful registration
      emit(RegisterSuccess(
        "User Created Successfully. Now perform Login to get your token",
      ));
    } catch (error) {
      // Handle errors, particularly DioError in this case
      if (error is DioError) {
        final response = error.response;
        print(response!.data);
        emit(RegisterError(response.data["detail"].toString()));
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
