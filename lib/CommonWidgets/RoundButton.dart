import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';

class RoundButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final double? horizontalMargin;
  final Color? buttonColor;
  final double? borderRadius;
  final borderWidth;
  final Gradient? gradient;
  final List<double> fontSize;
  final double? letterSpacing;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool? showDoubleLineText;
  final String? firstLineText;
  final String? secondLineText;
  const RoundButton(
      {this.text,
      this.onPressed,
      this.horizontalMargin,
      this.buttonHeight,
      this.buttonWidth,
      this.firstLineText,
      this.secondLineText,
      this.letterSpacing,
      this.showDoubleLineText,
      this.borderColor,
      this.buttonColor,
      this.textStyle,
      this.borderWidth,
      required this.fontSize,
      this.gradient,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        height: buttonHeight ?? 55,
        width: buttonWidth ?? deviceWidth(context) * 1,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0.0),
        decoration: BoxDecoration(
            // gradient: gradient ??
            //     LinearGradient(
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Colors.white,
            //         ]),
            border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 2.0),
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
            color: buttonColor ?? AppConsts.splashColor),
        child: showDoubleLineText == true
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      firstLineText!,
                      style: textStyle ??
                          TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: letterSpacing ?? 0.0,
                            fontFamily: 'Helvetica',
                          ),
                      presetFontSizes: fontSize,
                    ),
                    AutoSizeText(
                      secondLineText!,
                      style: textStyle ??
                          TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            letterSpacing: letterSpacing ?? 0.0,
                            fontFamily: 'Helvetica',
                          ),
                      presetFontSizes: fontSize,
                    ),
                  ],
                ),
              )
            : Center(
                child: AutoSizeText(
                  text!,
                  style: textStyle ??
                      TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        letterSpacing: letterSpacing ?? 0.0,
                        fontFamily: 'Helvetica',
                      ),
                  presetFontSizes: fontSize,
                ),
              ),
      ),
    );
  }
}
