import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocwapp/actions/actions.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/models/user/user_type.dart';
import 'package:ocwapp/presentation/splash/signup_page.dart';
import 'package:redux/redux.dart';

class SignUpContainer extends StatelessWidget {
  static const String routeNamed = 'Sign';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return SignUpPage(
          signUpComplete: _viewModel.onSetUser,
          isLoggingIn: _viewModel.isLoading,
        );
      },
    );
  }
}

class _ViewModel {
  User user;
  final bool isLoading;
  Function onSetUser;

  _ViewModel({
    this.user,
    this.isLoading,
    this.onSetUser,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.user.isLoggingIn,
        user: store.state.user.profile,
        onSetUser: (
            {String phoneNumber,
            String firstName,
            String address,
            String lastName,
            UserType userType,
            String vehicleDetails,
            String emailId,
            String city,
            String pin,
            String street,
            String password}) {
          User user = User().rebuild((b) {
            b..firstName = firstName;
            b..emailId = emailId;
            b..address = address;
            b..vehicleDetails = vehicleDetails;
            b..city = city;
            b..amount = '0';
            b..pin = pin;
            b..phoneNumber = phoneNumber;
            b..street = street;
            b..userType = userType;
            b..password = password;
          });
          store.dispatch(SetUser(user: user));
        });
  }
}
