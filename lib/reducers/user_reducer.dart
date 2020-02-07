import 'package:ocwapp/actions/user_action.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:redux/redux.dart';

Reducer<UserState> userReducer = combineReducers([
  TypedReducer<UserState, SetUser>(setUserReducer),
  TypedReducer<UserState, SetUserComplete>(setUserCompleteReducer),
  TypedReducer<UserState, Logout>(logoutReducer),
  TypedReducer<UserState, UpdateUser>(updateUserReducer),
]);

UserState setUserReducer(UserState userState, SetUser action) {
  UserState newState = userState.rebuild((b) => b
    ..isLoggingIn = true
    ..isLoggedIn = false);
  return newState;
}

UserState setUserCompleteReducer(UserState state, SetUserComplete action) {
  return state.rebuild((b) {
    b..profile = action.user.toBuilder();
    b..isLoggingIn = false;
    b..isLoggedIn = true;
  });
}


UserState logoutReducer(UserState state, Logout action) {
  return state.rebuild((b) {
    b..profile = null;
    b..isLoggedIn = false;
  });
}

UserState updateUserReducer(UserState state, UpdateUser action) {
  return state.rebuild((b) => b..profile = action.user.toBuilder());
}

