import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ocwapp/models/user/user_type.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  @nullable
  @BuiltValueField(wireName: "franchise_name")
  String get firstName;

  @nullable
  @BuiltValueField(wireName: "franchise_id")
  String get id;

  @nullable
  @BuiltValueField(wireName: "email_id")
  String get emailId;

  @nullable
  @BuiltValueField(wireName: "pin_code")
  String get pin;

  @nullable
  @BuiltValueField(wireName: "add_2")
  String get address;

  @nullable
  @BuiltValueField(wireName: "add_1")
  String get street;

  @nullable
  @BuiltValueField(wireName: "user_pass_word")
  String get password;

  @nullable
  @BuiltValueField(wireName: "vehicle_details")
  String get vehicleDetails;

  @nullable
  bool get isClient {
    if (UserType.Customer == userType) {
      return true;
    } else {
      return false;
    }
  }

  @nullable
  String get amount;

  @nullable
  @BuiltValueField(wireName: "city_area")
  String get city;

  @nullable
  @BuiltValueField(wireName: "franchise_type")
  UserType get userType;

  @nullable
  @BuiltValueField(wireName: "mobile_no")
  String get phoneNumber;

 @nullable
  @BuiltValueField(wireName: "app_cust_ivr_number")
  String get ivrNumber;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;
}
