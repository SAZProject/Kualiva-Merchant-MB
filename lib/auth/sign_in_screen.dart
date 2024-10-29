import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/utility/permission_utils.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameCtl = TextEditingController();
  final TextEditingController _passwordCtl = TextEditingController();
  bool passObscure = true;

  @override
  void dispose() {
    _usernameCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }

  void _onPressedSignIn(BuildContext context) {
    PermissionUtils.requestPermission(context).then(
      (value) {
        if (value) {
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.mainLayout, (route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: Sizeutils.height,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 6.h),
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
                  SizedBox(height: 25.h),
                  Text(
                    context.tr("sign_in.welcome"),
                    style: theme(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.h),
                  _signInMenu(context),
                  const Spacer(),
                  _buildTAC(context),
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
          SizedBox(height: 25.h),
          Text(
            context.tr("sign_in.merchant_acc"),
            style: CustomTextStyles(context).bodyLargeOnPrimaryContainer_06,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h),
          _textFieldUsername(context),
          SizedBox(height: 10.h),
          _textFieldPassword(context),
          SizedBox(height: 25.h),
          _signInButton(context),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _textFieldUsername(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomTextFormField(
        controller: _usernameCtl,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.text,
        contentPadding: EdgeInsets.all(12.h),
      ),
    );
  }

  Widget _textFieldPassword(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomTextFormField(
        controller: _passwordCtl,
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
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return CustomElevatedButton(
      initialText: context.tr("sign_in.sign_in_btn"),
      buttonStyle: CustomButtonStyles.none,
      decoration:
          CustomButtonStyles.gradientYellowAToPrimaryL10Decoration(context),
      buttonTextStyle: CustomTextStyles(context).titleMediumOnPrimaryContainer,
      onPressed: () => _onPressedSignIn(context),
    );
  }

  Widget _buildTAC(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.tr("sign_in.tos_statement"),
                    style:
                        CustomTextStyles(context).bodySmallOnPrimaryContainer,
                  ),
                  TextSpan(
                    text: context.tr("sign_in.tos"),
                    style: theme(context).textTheme.labelMedium!.copyWith(
                          color: appTheme.yellowA700,
                          decorationColor: appTheme.yellowA700,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                      text: " ", style: theme(context).textTheme.labelMedium),
                  TextSpan(
                    text: context.tr("sign_in.policy_statement"),
                    style:
                        CustomTextStyles(context).bodySmallOnPrimaryContainer,
                  ),
                  TextSpan(
                    text: context.tr("sign_in.policy"),
                    style: theme(context).textTheme.labelMedium!.copyWith(
                          color: appTheme.yellowA700,
                          decorationColor: appTheme.yellowA700,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
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
