import 'package:flutter/material.dart';
import 'package:polso/AppConsts/AppConsts.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? showPrefixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? horizontalMargin;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Function()? onTap;
  final bool? isObsecure;
  final TextEditingController? controller;
  final bool? wantBorder;
  Function(String)? onChanged;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool? readOnly;
  final int? maxLength;
  CustomTextField(
      {this.hintStyle,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.readOnly,
      this.borderColor,
      this.wantBorder,
      this.onChanged,
      this.showPrefixIcon,
      this.width,
      this.focusNode,
      this.controller,
      this.isObsecure,
      this.maxLength,
      this.height,
      this.keyboardType,
      this.horizontalMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? deviceWidth(context),
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? deviceWidth(context) * 0.05),
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        onTap: onTap,
        focusNode: focusNode,
        onChanged: (var value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        obscureText: isObsecure ?? false,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: showPrefixIcon == true
            ? InputDecoration(
                prefixIcon: prefixIcon,
                counterText: '',
                suffixIcon: suffixIcon ?? const SizedBox(),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: wantBorder == false
                    ? null
                    : OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(
                            color: borderColor ?? Colors.grey, width: 0.0),
                      ),
                border: wantBorder == false ? null : const OutlineInputBorder(),
                hintText: hintText ?? '',
                hintStyle: hintStyle,
                contentPadding:
                    const EdgeInsets.only(left: 15.0, top: 5.0, right: 15),
              )
            : InputDecoration(
                fillColor: Colors.white,
                filled: true,
                counterText: '',
                suffixIcon: suffixIcon ?? const SizedBox(),
                enabledBorder: wantBorder == false
                    ? null
                    : OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide: BorderSide(
                            color: borderColor ?? Colors.grey, width: 0.0),
                      ),
                border: wantBorder == false ? null : const OutlineInputBorder(),
                hintText: hintText ?? '',
                hintStyle: hintStyle ?? AppConsts.greenNormal15,
                contentPadding:
                    const EdgeInsets.only(left: 15.0, top: 5.0, right: 15),
              ),
      ),
    );
  }
}
