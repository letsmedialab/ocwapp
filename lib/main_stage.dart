import 'package:flutter/material.dart';
import 'package:ocwapp/main.dart';

import 'app_config.dart';

void main() {
  AppConfig.setupEnv(Environment.stage);
  runApp(OlaCarWash());
}
