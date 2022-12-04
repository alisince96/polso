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

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
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
              Center(
                child: AutoSizeText(
                  'Balance',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w800),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [24],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: AutoSizeText(
                  '\$0.00',
                  style: AppConsts.whiteNormal25
                      .copyWith(fontWeight: FontWeight.w800),
                  //textAlign: TextAlign.center,
                  presetFontSizes: [24],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 90,
                    width: 161,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF14477d)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Spend\nSweatcoins',
                            style: AppConsts.whiteNormal25
                                .copyWith(fontWeight: FontWeight.w400),
                            //textAlign: TextAlign.center,
                            presetFontSizes: [16],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 26,
                            width: 77,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF5080a6)),
                            child: Center(
                              child: AutoSizeText(
                                'Go to shop',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [10],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 161,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF14477d)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Claim\nBonuses',
                            style: AppConsts.whiteNormal25
                                .copyWith(fontWeight: FontWeight.w400),
                            //textAlign: TextAlign.center,
                            presetFontSizes: [16],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 26,
                            width: 77,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF5080a6)),
                            child: Center(
                              child: AutoSizeText(
                                'Earn more',
                                style: AppConsts.whiteNormal25
                                    .copyWith(fontWeight: FontWeight.w400),
                                //textAlign: TextAlign.center,
                                presetFontSizes: [10],
                              ),
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
              SizedBox(
                height: 25,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xFF2b5180),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth(context) * 0.05, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'Today',
                            style: AppConsts.whiteNormal25
                                .copyWith(fontWeight: FontWeight.w800),
                            //textAlign: TextAlign.center,
                            presetFontSizes: [24],
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF325e87)),
                            child: Center(
                              child: AutoSizeText(
                                '\$0.00',
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
                        height: 20,
                      ),
                      AutoSizeText(
                        'You haven’t earned any sweatcoins from your steps yet. Do some steps and see the results!',
                        style: AppConsts.whiteNormal25
                            .copyWith(fontWeight: FontWeight.w300),
                        //textAlign: TextAlign.center,
                        presetFontSizes: [13],
                      ),
                      const Spacer(),
                      RoundButton(
                        buttonColor: Color(0xFFFBB017),
                        buttonHeight: 38,
                        buttonWidth: deviceWidth(context),
                        horizontalMargin: deviceWidth(context) * 0.08,
                        borderWidth: 0.0,
                        fontSize: const [16],
                        onPressed: () async {},
                        text: 'See all transactions',
                        textStyle: AppConsts.blackNormal15
                            .copyWith(fontWeight: FontWeight.w600),
                        borderRadius: 30,
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
