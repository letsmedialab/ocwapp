import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ocwapp/actions/actions.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/presentation/booking_page.dart';
import 'package:redux/redux.dart';

class BookingContainer extends StatelessWidget {
  static const String routeNamed = 'Booking';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _viewModel) {
        return BookingPage(_viewModel.onBooking);
      },
    );
  }
}

class _ViewModel {
  final User user;
  final Function onBooking;

  _ViewModel({
    this.user,
    this.onBooking,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        user: store.state.user.profile,
        onBooking: () {
          store.dispatch(CreateSession());
        });
  }
}
