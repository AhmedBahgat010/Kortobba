import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_state.dart';

import '../../../data/repositories/auth_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final registerRepository = AuthRepository();

  final formKey = GlobalKey<FormBuilderState>();

  Future<void> register() async {
    try {
      final formData = getFormData();
      if (formData == null) return;

      emit(RegisterLoading());

      await registerRepository.register(
        username: formData['username'] ?? "",
        password: formData['password'] ?? "",
        lastName: formData['lastname'] ?? "",
        email: formData['email'] ?? "",
        firstName: formData['firstname']??"",
      );

      emit(RegisterSuccess(
        "User Created Successfully.  Now perform Login to get your token"
      ));
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  Map<String, dynamic>? getFormData() {
    final formState = formKey.currentState;

    if (formState == null) return null;
    if (formState.saveAndValidate() == false) return null;

    return formState.value;
  }
}
