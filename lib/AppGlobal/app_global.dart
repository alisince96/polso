import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage storage = FlutterSecureStorage();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? context = navigatorKey.currentContext;
