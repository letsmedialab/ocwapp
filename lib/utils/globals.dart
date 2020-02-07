import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ocwapp/middleware/app_middleware.dart';
import 'package:ocwapp/middleware/user_middleware.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/call.dart';
import 'package:ocwapp/reducers/app_state_reducer.dart';
import 'package:ocwapp/service/broadcaster_service.dart';
import 'package:ocwapp/service/preference_service.dart';
import 'package:redux/redux.dart';

final store =
    Store<AppState>(appReducer, initialState: AppState(), middleware: [
  appMiddleware,
  userMiddleware,
]);

final preferenceService = PreferencesService.getInstance();
final broadcasterService = BroadcasterService.getInstance();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

enum ReportType { post, comment, letter, mailing_list, user }

const String url = 'https://cleanngo.in/inside/ajax/ajax_app.php';

GetIt locator = GetIt.instance;

Call callService = locator<Call>();

void setupLocator() {
  locator.registerSingleton(Call());
}
