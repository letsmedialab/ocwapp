import 'package:ocwapp/actions/actions.dart';
import 'package:ocwapp/database/user/user_database.dart';
import 'package:ocwapp/models/app_state.dart';
import 'package:ocwapp/models/broadcaster_event.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/service/broadcaster_service.dart';
import 'package:ocwapp/utils/globals.dart';
import 'package:redux/redux.dart';

Future<Null> userMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  print("*******action called  " + action.runtimeType.toString() + "  *****");
  print("In user middleware");
  switch (action.runtimeType) {
    case SetUser:
      next(action);
      if (action.user.id == null) {
        insertUser(
                firstName: action.user.firstName,
                vehicleDetails: action.user.vehicleDetails,
                address: action.user.address,
                pin: action.user.pin,
                mobileNo: action.user.phoneNumber,
                emailId: action.user.emailId,
                city: action.user.city,
                street: action.user.street,
                password: action.user.password)
            .then((String id) {

          User user = action.user;
          user = user.rebuild((b) => b..id = id);
          preferenceService.setAuthUser(user);
          store.dispatch(SetUserComplete(user: user));
        }).catchError((e) {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': e.toString(), 'type': 'signup'}));
        });
      } else {
        preferenceService.setAuthUser(action.user);
        store.dispatch(SetUserComplete(user: action.user));
      }
      break;

    case SetUserComplete:
      next(action);
      broadcasterService
          .broadcast(BroadcasterEvent(event: BroadcasterEventType.onSignUp));
      break;
    case Logout:
      next(action);
      await preferenceService.logout();
      broadcasterService
          .broadcast(BroadcasterEvent(event: BroadcasterEventType.onLogout));
      break;
    case Logging:
      print('id is ${action.id} , password is ${action.password}');
      login(emailId: action.id, password: action.password).then((value) {
        print('value $value');
        if (value != null) {
          broadcasterService
              .broadcast(BroadcasterEvent(event: BroadcasterEventType.onLogin));
//          showBooking(firstName: value.firstName, vehicleDetails: value.vehicleDetails, address: value.address, pin: value.pin, id: value.id, mobileNo: value.phoneNumber, emailId: value.emailId, city: value.city, street: value.street, password: value.password);

          store.dispatch(SetUser(user: value));
        } else {
          broadcasterService.broadcast(BroadcasterEvent(
              event: BroadcasterEventType.onError,
              data: {'Error': 'Invalid Credentials', 'type': 'login'}));
        }
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    case UpdateUser:
      updateUser(
              firstName: action.user.firstName,
              id: action.user.id,
              userType: action.user.userType.toString(),
              address: action.user.address,
              pin: action.user.pin,
              mobileNo: action.user.phoneNumber,
              emailId: action.user.emailId,
              city: action.user.city,
              street: action.user.street,
              password: action.user.password,
              lastName: action.user.lastName)
          .then((b) {
        print(b);
        if (b == 'success') {
          broadcasterService.broadcast(
              BroadcasterEvent(event: BroadcasterEventType.onUpdateUser));
          next(action);
        }
      }).catchError((e) {
        broadcasterService.broadcast(BroadcasterEvent(
            event: BroadcasterEventType.onError,
            data: {'Error': e.toString()}));
      });
      break;

    default:
      next(action);
  }
}
