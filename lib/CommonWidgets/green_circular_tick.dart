import 'package:flutter/material.dart';
import 'package:polso/AppConsts/AppConsts.dart';

class CircularIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconSize;
  final IconType iconType;
  final Color? iconColor;
  final Color? circleColor;

  const CircularIcon(
      {this.height,
      this.width,
      this.iconSize,
      required this.iconType,
      this.circleColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40,
      width: width ?? 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: circleColor ?? AppConsts.greenish),
      child: iconType.name == 'success'
          ? Center(
              child: Icon(
              Icons.done,
              size: iconSize ?? 27,
              color: iconColor ?? AppConsts.white,
            ))
          : iconType.name == 'exclaimation'
              ? Center(
                  child: Image.asset(
                  'assets/images/exclaim.png',
                  scale: 3,
                  color: iconColor ?? AppConsts.white,
                ))
              : iconType.name == 'question'
                  ? Center(
                      child: Icon(
                      Icons.question_mark,
                      size: iconSize ?? 27,
                      color: iconColor ?? AppConsts.white,
                    ))
                  : Center(
                      child: Icon(
                      Icons.close,
                      size: iconSize ?? 27,
                      color: iconColor ?? AppConsts.white,
                    )),
    );
  }
}

enum IconType { success, exclaimation, delete, question, close }
