import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/CommonWidgets/RoundButton.dart';

Future<dynamic>? showGlobalDialog(BuildContext context,
    {required bool wantSingleButton,
    required bool wantDoubleButtons,
    String? singleButtonTitle,
    String? firstButtonTitle,
    String? secondButtonTitle,
    String? heading,
    String? subHeading,
    required Widget topIcon,
    Function? singleButtonOnPress,
    Function? firstButtonOnPress,
    Function? secondButtonOnPress,
    Color? singleButtonColor,
    Color? firstButtonColor,
    Color? secondButtonColor}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black87,
    builder: (ctx) => WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: AppConsts.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            content: SingleChildScrollView(
              child: Container(
                color: AppConsts.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    topIcon,
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    SizedBox(
                      child:
                          Text(heading ?? '', style: AppConsts.blackSemiBold),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      child: Text(subHeading ?? '',
                          textAlign: TextAlign.center,
                          style: AppConsts.blackSemiBold14),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Visibility(
                      visible: wantSingleButton,
                      child: RoundButton(
                        buttonColor: singleButtonColor ?? AppConsts.blue,
                        buttonHeight: deviceHeight(context) * 0.07,
                        buttonWidth: deviceWidth(context),
                        horizontalMargin: deviceWidth(context) * 0,
                        borderWidth: 0.0,
                        fontSize: const [18],
                        onPressed: singleButtonOnPress ?? () {},
                        text: singleButtonTitle ?? '',
                        textStyle: AppConsts.whiteNormal25,
                        borderRadius: 10,
                      ),
                    ),
                    Visibility(
                      visible: wantDoubleButtons,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundButton(
                            buttonColor: firstButtonColor ?? AppConsts.greyish,
                            buttonHeight: deviceHeight(context) * 0.07,
                            buttonWidth: deviceWidth(context) * 0.36,
                            horizontalMargin: deviceWidth(context) * 0.0,
                            borderWidth: 0.0,
                            fontSize: const [15],
                            onPressed: firstButtonOnPress ?? () {},
                            text: firstButtonTitle ?? '',
                            textStyle: AppConsts.whiteNormal25,
                            borderRadius: 10,
                          ),
                          RoundButton(
                            buttonColor: secondButtonColor ?? AppConsts.blue,
                            buttonHeight: deviceHeight(context) * 0.07,
                            buttonWidth: deviceWidth(context) * 0.36,
                            horizontalMargin: deviceWidth(context) * 0.0,
                            borderWidth: 0.0,
                            fontSize: const [15],
                            onPressed: secondButtonOnPress ?? () {},
                            text: secondButtonTitle ?? '',
                            textStyle: AppConsts.whiteNormal25,
                            borderRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    ),
  );
}
