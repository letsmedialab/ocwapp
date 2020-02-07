import 'package:ocwapp/actions/actions.dart';
import 'package:ocwapp/database/user/user_database.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/broadcaster_event.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/service/broadcaster_service.dart';
import 'package:ocwapp/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> appMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  print("In app middleware");

  switch (action.runtimeType) {
    case CheckSession:
      preferenceService.getAuthUser().then((User user) {
        if (user != null && user.id != null) {
          login(password: user.password, emailId: user.emailId).then((value) {
            store.dispatch(SetUserComplete(user: value));
          });
        }
      });
      break;
    case ExitSession:
      preferenceService.setAuthUser(store.state.user.profile).then((v) {
        broadcasterService.broadcast(
            BroadcasterEvent(event: BroadcasterEventType.onExitSession));
      });
      break;

    case OnRefreshWallet:
      next(action);
      store.dispatch(CheckSession());
      login(
              password: store.state.user.profile.password,
              emailId: store.state.user.profile.emailId)
          .then((value) {
//        showBooking(
//            firstName: value.firstName,
//            vehicleDetails: value.vehicleDetails,
//            address: value.address,
//            pin: value.pin,
//            id: value.id,
//            mobileNo: value.phoneNumber,
//            emailId: value.emailId,
//            city: value.city,
//            street: value.street,
//            password: value.password);

        store.dispatch(OnRefreshWalletComplete());
        store.dispatch(SetUser(user: value));
      });
      break;

    case CreateSession:
      createSession();
      print('came');
      break;
    default:
      next(action);
  }
}
