import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocwapp/presentation/splash/fp.dart';
import 'package:ocwapp/utils/globals.dart';

import 'actions/actions.dart';
import 'containers/booking_container.dart';
import 'containers/home_page_container.dart';
import 'containers/login_container.dart';
import 'containers/signup_container.dart';
import 'containers/splash_container.dart';
import 'utils/string.dart';

class OlaCarWash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    store.dispatch(CheckSession());
    return StoreProvider(
      store: store,
      child: MaterialApp(
        color: Colors.greenAccent,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
        ),
        title: StringValue.appTitle,
        initialRoute: SplashContainer.routeNamed,
        routes: {
          FrontPage.routeNamed: (BuildContext context) => FrontPage(),
          SplashContainer.routeNamed: (BuildContext context) =>
              SplashContainer(),
          BookingContainer.routeNamed: (BuildContext context) =>
              BookingContainer(),
          HomePageContainer.routeNamed: (BuildContext context) =>
              HomePageContainer(),
          SignUpContainer.routeNamed: (BuildContext context) =>
              SignUpContainer(),
          LoginContainer.routeNamed: (BuildContext context) => LoginContainer(),
        },
      ),
    );
  }
}