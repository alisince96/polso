import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool validatePassword(String value) {
  if (value.length >= 5) {
    return true;
  } else {
    return false;
  }
}

bool validateEmail(String email) {
  return !RegExp(r'^\d+(?:\d+)?$').hasMatch(email);
}

Future<bool> checkInternetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      debugPrint('connected');
      return true;
    }
  } on SocketException catch (_) {
    debugPrint('not connected');
    return false;
  }
  return false;
}

Timestamp dateTimeToTimestamp(DateTime dateTime) {
  return Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);
}
