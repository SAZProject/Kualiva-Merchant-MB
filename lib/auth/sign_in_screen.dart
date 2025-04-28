import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kualiva_merchant_mb/auth/bloc/auth_bloc.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/utility/permission_utils.dart';
import 'package:kualiva_merchant_mb/common/utility/save_pref.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_outlined_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_snack_bar.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtl = TextEditingController();
  final TextEditingController _passwordCtl = TextEditingController();
  bool passObscure = true;

  bool tosAgreement = false;

  @override
  void dispose() {
    _emailCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getTos();
  }

  void _getTos() async {
    tosAgreement = await SavePref().readTosData();
    setState(() {});
  }

  void _onPressedSignIn(BuildContext context) {
    if (_formKey.currentState!.validate() == false) return;

    final String email = _emailCtl.text.trim();
    final String password = _passwordCtl.text.trim();

    PermissionUtils.requestPermission(context).then(
      (value) async {
        if (value) {
          if (!context.mounted) return;
          if (!tosAgreement) {
            Navigator.pushNamed(context, AppRoutes.tosScreen).then(
              (value) {
                if (value == null) return;
                setState(() {
                  tosAgreement = value as bool;
                });
                SavePref().saveTosData(value as bool);
                if (!context.mounted) return;
                context.read<AuthBloc>().add(AuthLoggedIn(
                      email: email,
                      password: password,
                    ));
              },
            );
          } else {
            context.read<AuthBloc>().add(AuthLoggedIn(
                  email: email,
                  password: password,
                ));
          }
        }
      },
    );
  }

  void _onPressedSignUp(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.mainLayout, (route) => false);
        }
        if (state is AuthLoginFailure) {
          showSnackBar(context, Icons.error_outline, Colors.red,
              context.tr("common.error_try_again"), Colors.red);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: Sizeutils.height - 45.h,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 5.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 25.h),
                  CustomImageView(
                    imagePath: ImageConstant.appLogo,
                    height: 100.h,
                    width: 100.h,
                  ),
                  _signInMenu(context),
                  SizedBox(height: 10.h),
                  _buildTos(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInMenu(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            context.tr("sign_in.welcome"),
            style: theme(context).textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            context.tr("sign_in.merchant_acc"),
            style: CustomTextStyles(context).bodySmallOnPrimaryContainer_06,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          _textFieldEmail(context),
          SizedBox(height: 10.h),
          _textFieldPassword(context),
          SizedBox(height: 25.h),
          _signInButton(context),
          SizedBox(height: 10.h),
          Text(
            context.tr("sign_in.or"),
            style: CustomTextStyles(context).bodyLargeOnPrimaryContainer_06,
          ),
          SizedBox(height: 10.h),
          _signUpButton(context),
        ],
      ),
    );
  }

  Widget _textFieldEmail(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomTextFormField(
        controller: _emailCtl,
        hintText: context.tr("sign_in.email"),
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.all(12.h),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter some text";
          }

          return null;
        },
      ),
    );
  }

  Widget _textFieldPassword(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomTextFormField(
        controller: _passwordCtl,
        hintText: context.tr("sign_in.password"),
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.all(12.h),
        obscureText: passObscure,
        suffix: IconButton(
          onPressed: () {
            setState(() {
              passObscure = !passObscure;
            });
          },
          icon: Icon(
            passObscure ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter some text";
          }

          return null;
        },
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return CustomElevatedButton(
        isLoading: state is AuthLoading,
        initialText: context.tr("sign_in.sign_in_btn"),
        buttonStyle: CustomButtonStyles.fillprimary(context),
        decoration: null,
        buttonTextStyle:
            CustomTextStyles(context).titleMediumOnSecondaryContainer,
        onPressed: () => _onPressedSignIn(context),
      );
    });
  }

  Widget _signUpButton(BuildContext context) {
    return CustomOutlinedButton(
      text: context.tr("sign_in.sign_up_btn"),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomDecoration(context).outlinePrimary,
      buttonTextStyle: CustomTextStyles(context).titleMediumPrimary,
      onPressed: () => _onPressedSignUp(context),
    );
  }

  Widget _buildTos(BuildContext context) {
    return SizedBox(
      width: Sizeutils.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: tosAgreement,
            onChanged: (value) {
              Navigator.pushNamed(context, AppRoutes.tosScreen).then(
                (value) {
                  if (value == null) return;
                  setState(() {
                    tosAgreement = value as bool;
                  });
                  SavePref().saveTosData(value as bool);
                },
              );
            },
          ),
          Flexible(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.tr("tos.tos_statement"),
                    style:
                        CustomTextStyles(context).bodySmallOnPrimaryContainer,
                  ),
                  TextSpan(
                    text: context.tr("tos.tos"),
                    style: theme(context).textTheme.labelMedium!.copyWith(
                          color: theme(context).colorScheme.primary,
                          decorationColor: theme(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, AppRoutes.tosScreen).then(
                          (value) {
                            if (value == null) return;
                            setState(() {
                              tosAgreement = value as bool;
                            });
                            SavePref().saveTosData(value as bool);
                          },
                        );
                      },
                  ),
                  TextSpan(
                      text: " ", style: theme(context).textTheme.labelMedium),
                  TextSpan(
                    text: context.tr("tos.and"),
                    style:
                        CustomTextStyles(context).bodySmallOnPrimaryContainer,
                  ),
                  TextSpan(
                    text: context.tr("tos.policy"),
                    style: theme(context).textTheme.labelMedium!.copyWith(
                          color: theme(context).colorScheme.primary,
                          decorationColor: theme(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, AppRoutes.tosScreen).then(
                          (value) {
                            if (value == null) return;
                            setState(() {
                              tosAgreement = value as bool;
                            });
                            SavePref().saveTosData(value as bool);
                          },
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
