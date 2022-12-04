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

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
              EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
          child: ListView(
            children: [
              SizedBox(
                height: deviceHeight(context) * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/store.png',
                    scale: 3.5,
                  ),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF1b3d60)),
                    child: Center(
                      child: AutoSizeText(
                        'Balance \$0.00',
                        style: AppConsts.whiteNormal25
                            .copyWith(fontWeight: FontWeight.w400),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [14],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  RoundButton(
                    buttonColor: Color(0xFFFBB017),
                    buttonHeight: 34,
                    buttonWidth: 95,
                    horizontalMargin: 0,
                    borderWidth: 0.0,
                    fontSize: const [16],
                    onPressed: () async {},
                    text: 'Shop',
                    textStyle: AppConsts.blackNormal15
                        .copyWith(fontWeight: FontWeight.w600),
                    borderRadius: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RoundButton(
                    buttonColor: Color(0xFFFBB017),
                    buttonHeight: 34,
                    buttonWidth: 95,
                    horizontalMargin: 0,
                    borderWidth: 0.0,
                    fontSize: const [16],
                    onPressed: () async {},
                    text: 'Donate',
                    textStyle: AppConsts.blackNormal15
                        .copyWith(fontWeight: FontWeight.w600),
                    borderRadius: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RoundButton(
                    buttonColor: Color(0xFFFBB017),
                    buttonHeight: 34,
                    buttonWidth: 95,
                    horizontalMargin: 0,
                    borderWidth: 0.0,
                    fontSize: const [16],
                    onPressed: () async {},
                    text: 'Bid',
                    textStyle: AppConsts.blackNormal15
                        .copyWith(fontWeight: FontWeight.w600),
                    borderRadius: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 54,
              ),
              AutoSizeText(
                'Trending Now',
                style: AppConsts.whiteNormal25
                    .copyWith(fontWeight: FontWeight.w800),
                //textAlign: TextAlign.center,
                presetFontSizes: [24],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 280,
                decoration: BoxDecoration(
                    color: Color(0xFF2b5180),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 202,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceWidth(context) * 0.05),
                        child: AutoSizeText(
                          '1 Month  free trial with utalk’s learn any language',
                          style: AppConsts.whiteNormal25
                              .copyWith(fontWeight: FontWeight.w800),
                          //textAlign: TextAlign.center,
                          presetFontSizes: [18],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 161,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Color(0xFF7AF7FF),
                          Color(0xFF7AF7FF),
                          Color(0xFF7AF7FF),
                          Color(0xFF7AF7FF).withOpacity(0.7),
                          Color(0xFF7AF7FF).withOpacity(0.4),
                          Color(0xFF7AF7FF).withOpacity(0.2),
                          Color(0xFF7AF7FF).withOpacity(0.1)
                        ])),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: AutoSizeText(
                              'Browse\nDonations',
                              style: AppConsts.whiteNormal25
                                  .copyWith(fontWeight: FontWeight.w400),
                              //textAlign: TextAlign.center,
                              presetFontSizes: [20],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 161,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFA88ABD),
                              Color(0xFFA88ABD),
                              Color(0xFFA88ABD),
                              Color(0xFFA88ABD).withOpacity(0.7),
                              Color(0xFFA88ABD).withOpacity(0.4),
                              Color(0xFFA88ABD).withOpacity(0.2),
                              Color(0xFFA88ABD).withOpacity(0.1)
                            ])),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: AutoSizeText(
                              'Browse\nAuctions',
                              style: AppConsts.whiteNormal25
                                  .copyWith(fontWeight: FontWeight.w400),
                              //textAlign: TextAlign.center,
                              presetFontSizes: [20],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}
