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
import 'package:kortobaa_task/Features/auth/presentaion/view/registration.dart';
import 'package:kortobaa_task/Features/tabsScreens/presentaion/view/tabs_screen.dart';

import '../../../../Core/Utils/snackbars.dart';
import '../../../../Core/service_locator/service_locator.dart';
import 'manger/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            navigateAndFinished(context, TabsScreen());
          } else if (state is LoginError) {
            ServiceLocator.instance<Snackbars>().error(
              context: context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();

          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: FormBuilder(
                  key: loginCubit.formKey,
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
                                AssetsManager.login,
                                width: 120,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('تسجيل الدخول',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 24,
                                    color: AppColors.primaryColorOrange)),
                            SizedBox(height: 8),
                            Text('من فضلك قم بالدخول لإتمام الشراء',
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
                            const SizedBox(height: 32),
                            ButtonTemplate(
                              width: MediaQueryHelper.sizeFromWidth(context, 1),
                              colorText: AppColors.white,
                              color: AppColors.primaryColor,
                              text1: 'الدخول',
                              isLoading: state is LoginLoading,
                              onPressed: loginCubit.login,

                            ),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ليس لديك حساب ؟ ",
                                    style: AppTextStyles.w600.copyWith(
                                        fontSize: 18)),
                                InkWell(
                                    onTap: () {
                                      navigateTo(context, RegistrationScreen());
                                    },
                                    child: Text('التسجيل.',
                                        style: AppTextStyles.bold.copyWith(
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors
                                              .primaryColorOrange,
                                          color: AppColors.primaryColorOrange,
                                        ))),
                              ],
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
