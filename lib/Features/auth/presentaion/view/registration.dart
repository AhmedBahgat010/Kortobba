import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Assets%20Manager.dart';
import 'package:kortobaa_task/Core/Utils/Core%20Components.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Core/Utils/Shared%20Methods.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/login_screen.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_cubit.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/manger/register_state.dart';

import '../../../../Core/Utils/snackbars.dart';
import '../../../../Core/service_locator/service_locator.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>RegisterCubit(),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(24, 50, 24, 15),
                        child: Column(
                          children: [
                            Hero(
                              tag: "logo",
                              child: Image.asset(
                                AssetsManager.Registration,
                                width: 120,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('حساب جديد',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 24,
                                    color: AppColors.primaryColorOrange)),
                            SizedBox(height: 8),
                            Text('مرحبا بك ، قم بملأ البيانات للتسجيل',
                                style: AppTextStyles.w600.copyWith(
                                    color: AppColors.darkGrey, fontSize: 16)),
                          ],
                        ),
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
                                FormBuilderValidators.required(),
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
                                FormBuilderValidators.required(),
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
                                FormBuilderValidators.required(),
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
                                FormBuilderValidators.required(),
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
                                FormBuilderValidators.required(),
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
                                FormBuilderValidators.required(),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 40.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("لديك حساب ؟ ",
                                      style: AppTextStyles.w600.copyWith(
                                          fontSize: 18)),
                                  InkWell(
                                      onTap: () {
                                        navigateTo(context, LoginScreen());
                                      },
                                      child: Text('الدخول.',
                                          style: AppTextStyles.bold.copyWith(
                                            fontSize: 18,
                                            decoration: TextDecoration
                                                .underline,
                                            decorationColor: AppColors
                                                .primaryColorOrange,
                                            color: AppColors.primaryColorOrange,
                                          ))), SizedBox(height: 30,),

                                ],
                              ),
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
