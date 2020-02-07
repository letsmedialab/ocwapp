import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_type.g.dart';

class UserType extends EnumClass {
  static const UserType Customer = _$customer;
  static const UserType Online = _$online;
  static const UserType Franchise = _$franchise;
  static const UserType Freelancer = _$freelancer;
  static const UserType Admin = _$admin;

  static Serializer<UserType> get serializer => _$userTypeSerializer;

  const UserType._(String name) : super(name);

  static BuiltSet<UserType> get values => _$values;

  static UserType valueOf(String name) => _$valueOf(name);

  static String displayValueOf(UserType name) {
    switch (name) {
      case UserType.Admin:
        return "Admin";
      case UserType.Franchise:
        return "Franchise";
      case UserType.Online:
        return "online";
      case UserType.Freelancer:
        return "Freelancer";
      case UserType.Customer:
        return "Customer";
      default:
        return "Customer";
    }
  }
}
