import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Assets%20Manager.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/login_screen.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_cubit.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_state.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/widget/HaveAccount.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/widget/introAuth.dart';

import '../../../../Core/Utils/Navigater.dart';
import '../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';
import '../../../../Core/Utils/snackbars.dart';
import '../../../../Core/service_locator/service_locator.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ServiceLocator.instance<Snackbars>().success(
              context: context,
              message: state.message,
            );
          } else if (state is RegisterError) {
            ServiceLocator.instance<Snackbars>().error(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final registerCubit = context.read<RegisterCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: FormBuilder(
                  key: registerCubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyCustomIntroWidget(
                        heroTag: "logo",
                        imagePath: AssetsManager.login,
                        title: 'حساب جديد',
                        subTitle: 'مرحبا بك ، قم بملأ البيانات للتسجيل',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            TextFieldTemplate(
                              name: 'username',
                              label: 'ادخل اسم المستخدم',
                              boolleadingIcon: true,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              titel: "اسم المستخدم",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            TextFieldTemplate(
                              name: 'email',
                              label: 'ادخل البريد الالكتروني',
                              boolleadingIcon: true,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              titel: "البريد الالكتروني",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            TextFieldTemplate(
                              name: 'firstname',
                              label: 'ادخل الاسم الأول',
                              boolleadingIcon: true,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              titel: "الاسم الأول",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            TextFieldTemplate(
                              name: 'lastname',
                              label: 'ادخل الاسم الأخير',
                              boolleadingIcon: true,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              titel: "الاسم الأخير",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            TextFieldTemplate(
                              titel: "كلمة السر",
                              name: 'password',
                              label: "ادخل كلمة السر",
                              // leadingIcon: Iconsax.lock_1,
                              inputType: TextInputType.visiblePassword,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 16),
                            TextFieldTemplate(
                              titel: "تأكيد كلمة السر",
                              name: 'password',
                              label: "ادخل كلمة السر",
                              // leadingIcon: Iconsax.lock_1,
                              inputType: TextInputType.visiblePassword,
                              leadingIconColor: AppColors.greenYellow,
                              enableFocusBorder: false,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب"),
                              ]),
                            ),
                            const SizedBox(height: 32),
                            ButtonTemplate(
                              width: MediaQueryHelper.sizeFromWidth(context, 1),
                              colorText: AppColors.white,
                              color: AppColors.primaryColor,
                              text1: 'التسجيل',
                              isLoading: state is RegisterLoading,
                              onPressed: registerCubit.register,
                            ),
                            MyCustomHaveAccount(
                              noAccountText: "لديك حساب ؟ ",
                              registerText: 'الدخول.',
                              onTap: () {
                                navigateTo(context, LoginScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
