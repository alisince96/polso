import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:polso/models/stokvel_response.dart';
import 'package:polso/models/user_response.dart';
import 'package:polso/screens/homepage/cubit/homepage_cubit.dart';
import 'package:polso/screens/login/login.dart';
import 'package:polso/screens/profile/profile.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageCubit? homepageCubit;
  List<StokvelResponse> allStokvelsList = [];
  int currentlySelectedsStokvel = 0;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UserResponse? userResponse;
  @override
  void initState() {
    // BlocProvider.of<SignupCubit>(context).getCurrentUser();
    homepageCubit = BlocProvider.of(context);
    // homepageCubit?.getCurrentUserDataFromFirestore();
    // homepageCubit?.getAllStokvels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageCubit, HomepageState>(
      listener: (context, state) {
        // if (state is HomeLoading) {
        // } else if (state is HomeError) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(state.error ?? '')));
        // } else if (state is StokvelsFetched) {
        //   allStokvelsList = state.allStokvels ?? [];
        // } else if (state is UserDataFetched) {
        //   userResponse = state.userData;
        // } else if (state is LoginExpire) {
        //   Navigator.pushAndRemoveUntil(context,
        //       MaterialPageRoute(builder: (context) => Login()), (_) => false);
        // }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.03),
          child: ListView(
            children: [
              SizedBox(
                height: deviceHeight(context) * 0.02,
              ),
              Container(
                height: 99,
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.05,
                      vertical: deviceHeight(context) * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'We can now convert indoor steps',
                        style: AppConsts.black26Normal15
                            .copyWith(fontWeight: FontWeight.w400),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [15],
                      ),
                      const Spacer(),
                      RoundButton(
                        buttonColor: Color(0xFF143557),
                        buttonHeight: 33,
                        buttonWidth: deviceWidth(context),
                        horizontalMargin: deviceWidth(context) * 0.05,
                        borderWidth: 0.0,
                        fontSize: const [16],
                        onPressed: () async {},
                        text: 'Active now',
                        textStyle: AppConsts.whiteNormal25,
                        borderRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF1b3d60)),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 146,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF1b3d60)),
                    child: Center(
                      child: AutoSizeText(
                        'Balance 0.00',
                        style: AppConsts.whiteNormal25
                            .copyWith(fontWeight: FontWeight.w400),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [18],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: deviceHeight(context) * 0.1,
              ),
              Center(
                child: AutoSizeText(
                  '0',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w800),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [32],
                ),
              ),
              Center(
                child: AutoSizeText(
                  'Steps today',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w400),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [20],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: AutoSizeText(
                  '1,000 steps generates 1 sweatcoin (minus 5% processing fee)',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w400),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [12],
                ),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.1,
              ),
              Container(
                height: 310,
                decoration: BoxDecoration(
                    color: Color(0xFF1b3d60),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.05,
                      vertical: deviceHeight(context) * 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          child: Image.asset(
                            'assets/images/settings-half.png',
                            height: 94,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: AutoSizeText(
                          'Ready to start earning?',
                          style: AppConsts.whiteNormal25
                              .copyWith(fontWeight: FontWeight.w800),
                          //textAlign: TextAlign.center,
                          presetFontSizes: [18],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: AutoSizeText(
                          'We’ll start tracking your steps and converting them to sweatcoin after you update 3 settings',
                          style: AppConsts.whiteNormal25
                              .copyWith(fontWeight: FontWeight.w400),
                          //textAlign: TextAlign.center,
                          presetFontSizes: [14],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RoundButton(
                        buttonColor: AppConsts.white,
                        buttonHeight: 43,
                        buttonWidth: deviceWidth(context),
                        horizontalMargin: deviceWidth(context) * 0.2,
                        borderWidth: 0.0,
                        fontSize: const [16],
                        onPressed: () async {},
                        text: 'Update Settings',
                        textStyle: AppConsts.black26Normal15,
                        borderRadius: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 33,
                        width: deviceWidth(context) * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF143557)),
                        child: Center(
                          child: AutoSizeText(
                            'Settings completed 0/3',
                            style: AppConsts.whiteNormal25
                                .copyWith(fontWeight: FontWeight.w400),
                            //textAlign: TextAlign.center,
                            presetFontSizes: [14],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: AppConsts.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.05,
                      vertical: deviceHeight(context) * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Setting-up Sweatcoin',
                        style: AppConsts.black26Normal15.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppConsts.black),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [17],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        'Some of your device’s settings are preventing us from counting all your steps. Follow these easy instructions to get it sorted.',
                        style: AppConsts.black26Normal15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppConsts.black),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [12],
                      ),
                      const Spacer(),
                      RoundButton(
                        buttonColor: Color(0xFF143557),
                        buttonHeight: 33,
                        buttonWidth: deviceWidth(context),
                        horizontalMargin: deviceWidth(context) * 0.05,
                        borderWidth: 0.0,
                        fontSize: const [16],
                        onPressed: () async {},
                        text: 'Complete set-up',
                        textStyle: AppConsts.whiteNormal25,
                        borderRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
