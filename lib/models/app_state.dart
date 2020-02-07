import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:ocwapp/models/user/user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  bool get isLoading;

  UserState get user;

  static Serializer<AppState> get serializer => _$appStateSerializer;

  factory AppState() {
    return _$AppState((b) => b
      ..isLoading = false
      ..user = UserState().toBuilder());
  }

  AppState._();
}

abstract class UserState implements Built<UserState, UserStateBuilder> {
  @nullable
  bool get isLoggedIn;

  @nullable
  bool get isLoggingIn;

  @nullable
  User get profile;

  @nullable
  BuiltMap<String, String> get userDetails;

  static Serializer<UserState> get serializer => _$userStateSerializer;

  factory UserState() {
    return _$UserState((b) => b
      ..isLoggedIn = false
      ..isLoggingIn = false);
  }

  UserState._();
}
