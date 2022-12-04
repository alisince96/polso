import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';

class RoundButtonWithIconAtEnd extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final double? horizontalMargin;
  final Color? buttonColor;
  final textColor;
  final bool? showIconOnStart;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final double? spaceBetweenTextAndIcon;
  final double? buttonWidth;
  final double? buttonHeight;
  final TextStyle? textStyle;

  final Widget? icon;
  const RoundButtonWithIconAtEnd(
      {this.text,
      this.onPressed,
      this.horizontalMargin,
      this.buttonColor,
      this.spaceBetweenTextAndIcon,
      this.textColor,
      this.buttonWidth,
      this.textStyle,
      this.showIconOnStart,
      this.borderWidth,
      this.borderColor,
      this.buttonHeight,
      this.icon,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        height: buttonHeight ?? 60,
        width: buttonWidth ?? deviceWidth(context) * 1,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 0),
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
            color: buttonColor ?? Theme.of(context).colorScheme.secondary),
        child: Center(
            child: showIconOnStart == false || showIconOnStart == null
                ? Stack(
                    children: [
                      Positioned(
                        top: deviceHeight(context) * 0.025,
                        right: deviceWidth(context) * 0.03,
                        child: icon ??
                            Image.asset(
                              'assets/images/apple.png',
                              scale: 1.0,
                            ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Center(
                        child: AutoSizeText(
                          text!,
                          presetFontSizes: const [20],
                          style: textStyle ??
                              TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 1,
                                  fontFamily: AppConsts.font1,
                                  color: textColor ?? Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Positioned(
                        top: deviceHeight(context) * 0.025,
                        left: deviceWidth(context) * 0.06,
                        child: icon ??
                            Image.asset(
                              'assets/images/apple.png',
                              scale: 1.0,
                            ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Center(
                        child: AutoSizeText(
                          text!,
                          presetFontSizes: const [18],
                          style: textStyle ??
                              TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 1,
                                  fontFamily: AppConsts.font1,
                                  color: textColor ?? Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
