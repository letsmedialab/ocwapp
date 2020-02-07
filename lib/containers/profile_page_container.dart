import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocwapp/actions/user_action.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/presentation/profile/profile_page.dart';
import 'package:redux/redux.dart';

class ProfileContainer extends StatelessWidget {
  static const String routeNamed = 'Profile Container';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return ProfilePage(
          user: _viewModel.user,
          createRequest: _viewModel.createRequest,
          updateUser: _viewModel.updateUser,
          logout: _viewModel.logout,

        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function updateUser;
  final Function createRequest;
  final Function logout;

  _ViewModel({this.user, this.updateUser, this.logout, this.createRequest});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.user.profile,
        logout: () {
          store.dispatch(Logout());
        },
        updateUser: (User user) {
          store.dispatch(UpdateUser(user));
        },
       );
  }
}
