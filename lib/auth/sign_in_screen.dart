import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kualiva_merchant_mb/common/app_export.dart';
import 'package:kualiva_merchant_mb/common/style/custom_btn_style.dart';
import 'package:kualiva_merchant_mb/common/utility/permission_utils.dart';
import 'package:kualiva_merchant_mb/common/utility/save_pref.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_elevated_button.dart';
import 'package:kualiva_merchant_mb/common/widget/custom_outlined_button.dart';
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
  bool isLoading = false;

  bool tosAgreement = false;

  @override
  void dispose() {
    _usernameCtl.dispose();
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
    setState(() {
      isLoading = true;
    });
    PermissionUtils.requestPermission(context).then(
      (value) async {
        if (value) {
          if (!context.mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.mainLayout, (route) => false);
          // Map<String, String> body = {
          //   "usernameOrEmail": _usernameCtl.text.trim(),
          //   "password": _passwordCtl.text.trim(),
          // };
          // final dio = await DioClient().dio();
          // final res = await dio.post('/users-merchant/login', data: body);
          // Map<String, dynamic> mapRes = jsonDecode(res.toString());
          // debugPrint("data debug 1 " + mapRes.toString());
          // if (mapRes["status"] == 200) {
          //   setState(() {
          //     isLoading = false;
          //   });
          //   debugPrint("data debug 2 " + mapRes["data"].toString());
          //   Map<String, dynamic> mapData =
          //       Map<String, dynamic>.from(mapRes["data"]);
          //   debugPrint("data debug 3 " + mapData.toString());
          //   PrefUtils.setProfile(mapData.toString());
          //   if (!context.mounted) return;
          //   showSnackBar(context, Icons.done_outline, Colors.greenAccent,
          //       context.tr("sign_in.sign_in_success"), Colors.greenAccent);
          //   Navigator.pushNamedAndRemoveUntil(
          //       context, AppRoutes.mainLayout, (route) => false);
          // } else {
          //   setState(() {
          //     isLoading = false;
          //   });
          //   if (!context.mounted) return;
          //   showSnackBar(context, Icons.error_outline, Colors.red,
          //       context.tr("sign_in.sign_in_failed"), Colors.red);
          // }
        } else {
          setState(() {
            isLoading = true;
          });
        }
      },
    );
  }

  void _onPressedSignUp(BuildContext context) {}

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
          _textFieldUsername(context),
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

  Widget _textFieldUsername(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomTextFormField(
        controller: _usernameCtl,
        hintText: context.tr("sign_in.username"),
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
    return CustomElevatedButton(
      isLoading: isLoading,
      initialText: context.tr("sign_in.sign_in_btn"),
      buttonStyle: CustomButtonStyles.fillprimary(context),
      decoration: null,
      buttonTextStyle:
          CustomTextStyles(context).titleMediumOnSecondaryContainer,
      onPressed: () => _onPressedSignIn(context),
    );
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
