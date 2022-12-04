import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:polso/screens/bottomNavBar/bottom_nav_bar.dart';
import 'package:polso/screens/login_with_email/login_with_email.dart';
import 'package:polso/screens/onboarding/onboarding3.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';

class Onboarding4 extends StatefulWidget {
  const Onboarding4({Key? key}) : super(key: key);

  @override
  State<Onboarding4> createState() => _Onboarding4State();
}

class _Onboarding4State extends State<Onboarding4> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Firebase.initializeApp();

      bool isLoggedIn = BlocProvider.of<SignupCubit>(context).isLoggedIn();
      if (isLoggedIn) {
        // Future.delayed(const Duration(seconds: 10000000), () {
        //   Navigator.pushReplacement(context,
        //       MaterialPageRoute(builder: (context) => const BottomNavBar()));
        // });
      } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: deviceHeight(context) * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceWidth(context) * 0.04),
                child: AutoSizeText(
                  '> Almost there! Ineed you to allow me to count steps in the background. I don’t use location so i will not waste your battery!',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w400),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [20],
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWithEmail()));
                },
                text: 'Allow steps counting',
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Onboarding3()));
                },
                text: 'Skip',
                textStyle: AppConsts.black26Normal15,
                borderRadius: 10,
              ),
              SizedBox(
                height: deviceHeight(context) * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
