import 'dart:convert';

import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/serializers/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService {
  PreferencesService._();

  static final PreferencesService _instance = PreferencesService._();

  factory PreferencesService.getInstance() => _instance;

  static const AUTH_TOKEN = "auth_token";
  static const LOGGED_IN_USER = "logged_in_user";
  static const LIKED_POSTS = "liked_posts";
  static const PRICE_TAG = "price_tag";
  static const VIEWED_POST = "view_post";

  bool isAppDisabled = false;


  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  setAuthUser(User user) async {
    (await _getInstance()).setString(PreferencesService.LOGGED_IN_USER,
        json.encode(serializers.serializeWith(User.serializer, user)));
  }

  Future<User> getAuthUser() async {
    final user =
        (await _getInstance()).getString(PreferencesService.LOGGED_IN_USER);
    if (user == null) {
      return null;
    }
    return serializers.deserializeWith(User.serializer, json.decode(user));
  }


  Future logout() async {
    final lg = await _getInstance();
    lg.clear();
  }
}
