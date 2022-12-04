import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/CustomTextField.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:polso/screens/bottomNavBar/bottom_nav_bar.dart';
import 'package:polso/screens/onboarding/onboarding2.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';
import 'package:polso/screens/signup/signup.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  SignupCubit? signupCubit;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  void initState() {
    super.initState();
    signupCubit = BlocProvider.of<SignupCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
        } else if (state is SignupError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
        if (state is LoggedInSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: Scaffold(
            backgroundColor: AppConsts.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SizedBox(
                  width: deviceWidth(context),
                  child: Image.asset(
                    'assets/images/bg.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: deviceHeight(context) * 0.15,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: deviceHeight(context) * 0.2,
                        width: deviceWidth(context) * 0.5,
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.1,
                    ),
                    CustomTextField(
                      controller: emailController,
                      width: deviceWidth(context) * 0.72,
                      horizontalMargin: 5,
                      hintText: 'Email',
                      hintStyle: AppConsts.greyishNormal,
                      maxLength: 30,
                    ),
                    CustomTextField(
                      controller: passController,
                      width: deviceWidth(context) * 0.72,
                      horizontalMargin: 5,
                      hintText: 'Password',
                      hintStyle: AppConsts.greyishNormal,
                      maxLength: 30,
                    ),
                    const Spacer(),
                    RoundButton(
                      buttonColor: AppConsts.darkYellowish,
                      buttonHeight: 52,
                      buttonWidth: deviceWidth(context),
                      horizontalMargin: deviceWidth(context) * 0.1,
                      borderWidth: 0.0,
                      fontSize: const [16],
                      onPressed: () async {
                        if (emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter Email')));
                        } else if (passController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter Password')));
                        } else if (!validateEmail(emailController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('invalid email')));
                        } else {
                          print('test');
                          signupCubit?.loginUser(
                              emailController.text, passController.text);
                        }
                      },
                      text: 'Login',
                      textStyle: AppConsts.black26Normal15,
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundButton(
                      buttonColor: AppConsts.darkYellowish,
                      buttonHeight: 52,
                      buttonWidth: deviceWidth(context),
                      horizontalMargin: deviceWidth(context) * 0.1,
                      borderWidth: 0.0,
                      fontSize: const [16],
                      onPressed: () async {
                        print('test');
                        signupCubit?.loginUserWithGoogle();
                      },
                      text: 'Login with Google',
                      textStyle: AppConsts.black26Normal15,
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: AutoSizeText(
                        'Create your account',
                        style: AppConsts.whiteNormal25
                            .copyWith(fontWeight: FontWeight.w400),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [16],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
