import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocwapp/actions/actions.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/presentation/home_page.dart';
import 'package:redux/redux.dart';

class HomePageContainer extends StatelessWidget {
  static const String routeNamed = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return HomePage(
          _viewModel.user,
          _viewModel.onExit,
           _viewModel.logout,
          _viewModel.refresh
        );
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onLoadingComplete;
  final Function onExit;
  final String myPostCount;
  final String allPostCount;
  final String reportCount;
  final Function logout;
  final Function refresh;

  _ViewModel({
    this.user,
    this.onLoadingComplete,
    this.onExit,
    this.reportCount,
    this.myPostCount,
    this.allPostCount,
    this.logout,
    this.refresh,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      logout: () {
        store.dispatch(Logout());
      },
      refresh: (){
        store.dispatch(OnRefreshWallet());
      },
      user: store.state.user.profile,
      onExit: () {
        store.dispatch(ExitSession());
      },
      onLoadingComplete: () {
      },
    );
  }
}
