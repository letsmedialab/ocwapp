import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/models/user/user_type.dart';
import 'package:ocwapp/serializers/types.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  UserType,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(userList, () => ListBuilder<User>())
      ..addPlugin(new StandardJsonPlugin()))
    .build();
