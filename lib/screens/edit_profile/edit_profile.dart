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
import 'package:polso/screens/signup/cubit/signup_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          width: deviceWidth(context) * 0.22,
                        ),
                        AutoSizeText(
                          'Edit Profile',
                          style: AppConsts.whiteNormal25
                              .copyWith(fontWeight: FontWeight.w700),
                          //textAlign: TextAlign.center,
                          presetFontSizes: [20],
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
                              builder: (context) => EditProfileScreen()));
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
                    height: deviceHeight(context) * 0.02,
                  ),
                  RoundButton(
                    buttonColor: AppConsts.darkYellowish,
                    buttonHeight: 32,
                    buttonWidth: deviceWidth(context) * 0.35,
                    horizontalMargin: 0,
                    borderWidth: 0.0,
                    fontSize: const [16],
                    onPressed: () async {},
                    text: 'Change Avatar',
                    textStyle: AppConsts.whiteNormal25,
                    borderRadius: 30,
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.05),
                    child: Container(
                        // height: 70,
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF20558C)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth(context) * 0.05),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AutoSizeText(
                                  'Name*',
                                  style: AppConsts.whiteNormal25
                                      .copyWith(fontWeight: FontWeight.w400),
                                  //textAlign: TextAlign.center,
                                  presetFontSizes: [11],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'user',
                                        hintStyle: AppConsts.whiteNormal25
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.05),
                    child: Container(
                        // height: 70,
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF20558C)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth(context) * 0.05),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AutoSizeText(
                                  'Username*',
                                  style: AppConsts.whiteNormal25
                                      .copyWith(fontWeight: FontWeight.w400),
                                  //textAlign: TextAlign.center,
                                  presetFontSizes: [11],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'user',
                                        hintStyle: AppConsts.whiteNormal25
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.05),
                    child: Container(
                        // height: 70,
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF20558C)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth(context) * 0.05),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AutoSizeText(
                                  'Email*',
                                  style: AppConsts.whiteNormal25
                                      .copyWith(fontWeight: FontWeight.w400),
                                  //textAlign: TextAlign.center,
                                  presetFontSizes: [11],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'user',
                                        hintStyle: AppConsts.whiteNormal25
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.05),
                    child: Container(
                        height: deviceHeight(context) * 0.2,
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF20558C)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth(context) * 0.05),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AutoSizeText(
                                  'Description*',
                                  style: AppConsts.whiteNormal25
                                      .copyWith(fontWeight: FontWeight.w400),
                                  //textAlign: TextAlign.center,
                                  presetFontSizes: [11],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'user',
                                        hintStyle: AppConsts.whiteNormal25
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.02,
                  ),
                  RoundButton(
                    buttonColor: AppConsts.darkYellowish,
                    buttonHeight: 39,
                    buttonWidth: deviceWidth(context),
                    horizontalMargin: deviceWidth(context) * 0.13,
                    borderWidth: 0.0,
                    fontSize: const [16],
                    onPressed: () async {},
                    text: 'Save Changes',
                    textStyle: AppConsts.whiteNormal25,
                    borderRadius: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
