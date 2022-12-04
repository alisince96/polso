import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:polso/screens/bottomNavBar/bottom_nav_bar.dart';
import 'package:polso/screens/onboarding/onboarding1.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
                      height: deviceHeight(context) * 0.2,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: deviceHeight(context) * 0.2,
                        width: deviceWidth(context) * 0.5,
                      ),
                    ),
                    // const AutoSizeText(
                    //   'polso polso',
                    //   style: AppConsts.blackBold,
                    //   presetFontSizes: [40],
                    // ),
                    // const AutoSizeText.rich(
                    //   TextSpan(
                    //       text: 'Stokvel',
                    //       style: AppConsts.blackNormal15,
                    //       children: [
                    //         TextSpan(
                    //           text: ' saving ',
                    //           style: AppConsts.greenNormal15,
                    //         ),
                    //         TextSpan(
                    //           text: 'solution',
                    //           style: AppConsts.blackNormal15,
                    //         )
                    //       ]),
                    //   presetFontSizes: [20],
                    // ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.1),
                      child: const AutoSizeText(
                        'Convert your steps into a currency to spend on products, offers and supporting charitable causes',
                        style: AppConsts.whiteNormal25,
                        textAlign: TextAlign.center,
                        presetFontSizes: [14],
                      ),
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
                        signupCubit?.loginUserWithGoogle();
                      },
                      text: 'Signup with Google',
                      textStyle: AppConsts.black26Normal15,
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundButton(
                      buttonColor: AppConsts.white.withOpacity(0.7),
                      buttonHeight: 52,
                      buttonWidth: deviceWidth(context),
                      horizontalMargin: deviceWidth(context) * 0.1,
                      borderWidth: 0.0,
                      fontSize: const [16],
                      onPressed: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Onboarding1()));
                      },
                      text: 'Login to account',
                      textStyle: AppConsts.black26Normal15,
                      borderRadius: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.1),
                      child: AutoSizeText(
                        'BY Creating Account you Accept Terms of Use and Privacy Policy',
                        style: AppConsts.whiteNormal25
                            .copyWith(color: AppConsts.darkYellowish),
                        textAlign: TextAlign.center,
                        presetFontSizes: [14],
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
