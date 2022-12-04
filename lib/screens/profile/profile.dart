import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';
import 'package:polso/models/stokvel_response.dart';
import 'package:polso/models/user_response.dart';
import 'package:polso/screens/edit_profile/edit_profile.dart';
import 'package:polso/screens/homepage/cubit/homepage_cubit.dart';
import 'package:polso/screens/login/login.dart';
import 'package:polso/screens/settings/settings.dart';
import 'package:polso/screens/signup/cubit/signup_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF08274c),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/bg.png',
                      ))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF20558C)),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppConsts.white,
                                size: 18,
                              ),
                            ),
                          ),
                          Spacer(),
                          AutoSizeText(
                            'My Profile',
                            style: AppConsts.whiteNormal25
                                .copyWith(fontWeight: FontWeight.w700),
                            //textAlign: TextAlign.center,
                            presetFontSizes: [20],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileScreen()));
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF20558C)),
                              child: Icon(
                                Icons.edit,
                                color: AppConsts.white,
                                size: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF20558C)),
                              child: Icon(
                                Icons.settings,
                                color: AppConsts.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      child: Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(80),
                              color: Color(0xFF20558C)),
                          child: Image.asset(
                            'assets/images/person.png',
                            scale: 5,
                          )),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.01,
                    ),
                    AutoSizeText(
                      'Name',
                      style: AppConsts.whiteNormal25
                          .copyWith(fontWeight: FontWeight.w700),
                      //textAlign: TextAlign.center,
                      presetFontSizes: [20],
                    ),
                    AutoSizeText(
                      '@name1233',
                      style: AppConsts.whiteNormal25
                          .copyWith(fontWeight: FontWeight.w400),
                      //textAlign: TextAlign.center,
                      presetFontSizes: [15],
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              AutoSizeText(
                                '0',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w800),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [20],
                              ),
                              AutoSizeText(
                                'Following',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [15],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              AutoSizeText(
                                '0',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w800),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [20],
                              ),
                              AutoSizeText(
                                'Followers',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [15],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              AutoSizeText(
                                'Plan',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [16],
                              ),
                              AutoSizeText(
                                'Free',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w900),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [24],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              RoundButton(
                                buttonColor: AppConsts.darkYellowish,
                                buttonHeight: 32,
                                buttonWidth: deviceWidth(context) * 0.25,
                                horizontalMargin: 0,
                                borderWidth: 0.0,
                                fontSize: const [16],
                                onPressed: () async {},
                                text: 'Change',
                                textStyle: AppConsts.whiteNormal25,
                                borderRadius: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: Container(
                          height: deviceHeight(context) * 0.3,
                          width: deviceWidth(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF20558C)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 35,
                                    width: deviceWidth(context) * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Color(0xFF105BA9)),
                                  ),
                                  RoundButton(
                                    buttonColor: AppConsts.white,
                                    buttonHeight: 35,
                                    buttonWidth: deviceWidth(context) * 0.25,
                                    horizontalMargin: 0,
                                    borderWidth: 0.0,
                                    fontSize: const [16],
                                    onPressed: () async {},
                                    text: 'Today',
                                    textStyle: AppConsts.blackNormal15,
                                    borderRadius: 30,
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: deviceWidth(context) * 0.35,
                                    child: AutoSizeText(
                                      'Week',
                                      style: AppConsts.whiteNormal25.copyWith(
                                          fontWeight: FontWeight.w400),
                                      //textAlign: TextAlign.center,
                                      presetFontSizes: [16],
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: deviceWidth(context) * 0.06,
                                    child: AutoSizeText(
                                      'Month',
                                      style: AppConsts.whiteNormal25.copyWith(
                                          fontWeight: FontWeight.w400),
                                      //textAlign: TextAlign.center,
                                      presetFontSizes: [16],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth(context) * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              AutoSizeText(
                                'Sweatcoins generated',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [14],
                              ),
                              AutoSizeText(
                                '100',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w700),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [20],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              AutoSizeText(
                                'Total steps converted',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [14],
                              ),
                              AutoSizeText(
                                '1000',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w700),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [20],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
