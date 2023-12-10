import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/Assets%20Manager.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/registration.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/widget/HaveAccount.dart';
import 'package:kortobaa_task/Features/auth/presentaion/view/widget/introAuth.dart';
import 'package:kortobaa_task/Features/tabsScreens/presentaion/view/tabs_screen.dart';
import '../../../../Core/Utils/Navigater.dart';
import '../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';
import '../../../../Core/Utils/snackbars.dart';
import '../../../../Core/service_locator/service_locator.dart';
import 'manger/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            navigateAndFinished(context, const TabsScreen());
          }
          else if (state is LoginError) {
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
                      const MyCustomIntroWidget ( heroTag: "logo",
                    imagePath: AssetsManager.login,
                    title: 'تسجيل الدخول',
                    subTitle: 'من فضلك قم بالدخول لإتمام الشراء',
                  ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
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

                                FormBuilderValidators.required(errorText:"هذا الحقل مطلوب" ),

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
                                FormBuilderValidators.required(errorText:"هذا الحقل مطلوب" ),


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
                            MyCustomHaveAccount(
                              noAccountText: "ليس لديك حساب ؟ ",
                              registerText: "التسجيل.",
                              onTap: () {
                                // Your custom logic goes here
                                navigateTo(context, RegistrationScreen());
                              },
                            ),                          ],
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
