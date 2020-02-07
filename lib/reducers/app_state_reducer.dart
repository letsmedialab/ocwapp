import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/reducers/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return state.rebuild((b) => b
    ..user.replace(userReducer(state.user, action))
);
}
