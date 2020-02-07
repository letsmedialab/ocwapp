import 'package:flutter/material.dart';
import 'package:ocwapp/main.dart';
import 'package:ocwapp/utils/globals.dart';

import 'app_config.dart';

void main() {
  AppConfig.setupEnv(Environment.dev);
  setupLocator();
  runApp(OlaCarWash());
}
