// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.firstName != null) {
      result
        ..add('franchise_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('franchise_id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.emailId != null) {
      result
        ..add('email_id')
        ..add(serializers.serialize(object.emailId,
            specifiedType: const FullType(String)));
    }
    if (object.pin != null) {
      result
        ..add('pin_code')
        ..add(serializers.serialize(object.pin,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('add_2')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.street != null) {
      result
        ..add('add_1')
        ..add(serializers.serialize(object.street,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('user_pass_word')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.vehicleDetails != null) {
      result
        ..add('vehicle_details')
        ..add(serializers.serialize(object.vehicleDetails,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city_area')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.userType != null) {
      result
        ..add('franchise_type')
        ..add(serializers.serialize(object.userType,
            specifiedType: const FullType(UserType)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('mobile_no')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.ivrNumber != null) {
      result
        ..add('app_cust_ivr_number')
        ..add(serializers.serialize(object.ivrNumber,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'franchise_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'franchise_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email_id':
          result.emailId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pin_code':
          result.pin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'add_2':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'add_1':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_pass_word':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vehicle_details':
          result.vehicleDetails = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city_area':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'franchise_type':
          result.userType = serializers.deserialize(value,
              specifiedType: const FullType(UserType)) as UserType;
          break;
        case 'mobile_no':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'app_cust_ivr_number':
          result.ivrNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String firstName;
  @override
  final String id;
  @override
  final String emailId;
  @override
  final String pin;
  @override
  final String address;
  @override
  final String street;
  @override
  final String password;
  @override
  final String vehicleDetails;
  @override
  final String amount;
  @override
  final String city;
  @override
  final UserType userType;
  @override
  final String phoneNumber;
  @override
  final String ivrNumber;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.firstName,
      this.id,
      this.emailId,
      this.pin,
      this.address,
      this.street,
      this.password,
      this.vehicleDetails,
      this.amount,
      this.city,
      this.userType,
      this.phoneNumber,
      this.ivrNumber})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        firstName == other.firstName &&
        id == other.id &&
        emailId == other.emailId &&
        pin == other.pin &&
        address == other.address &&
        street == other.street &&
        password == other.password &&
        vehicleDetails == other.vehicleDetails &&
        amount == other.amount &&
        city == other.city &&
        userType == other.userType &&
        phoneNumber == other.phoneNumber &&
        ivrNumber == other.ivrNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, firstName.hashCode),
                                                    id.hashCode),
                                                emailId.hashCode),
                                            pin.hashCode),
                                        address.hashCode),
                                    street.hashCode),
                                password.hashCode),
                            vehicleDetails.hashCode),
                        amount.hashCode),
                    city.hashCode),
                userType.hashCode),
            phoneNumber.hashCode),
        ivrNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('firstName', firstName)
          ..add('id', id)
          ..add('emailId', emailId)
          ..add('pin', pin)
          ..add('address', address)
          ..add('street', street)
          ..add('password', password)
          ..add('vehicleDetails', vehicleDetails)
          ..add('amount', amount)
          ..add('city', city)
          ..add('userType', userType)
          ..add('phoneNumber', phoneNumber)
          ..add('ivrNumber', ivrNumber))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _emailId;
  String get emailId => _$this._emailId;
  set emailId(String emailId) => _$this._emailId = emailId;

  String _pin;
  String get pin => _$this._pin;
  set pin(String pin) => _$this._pin = pin;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _street;
  String get street => _$this._street;
  set street(String street) => _$this._street = street;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _vehicleDetails;
  String get vehicleDetails => _$this._vehicleDetails;
  set vehicleDetails(String vehicleDetails) =>
      _$this._vehicleDetails = vehicleDetails;

  String _amount;
  String get amount => _$this._amount;
  set amount(String amount) => _$this._amount = amount;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  UserType _userType;
  UserType get userType => _$this._userType;
  set userType(UserType userType) => _$this._userType = userType;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _ivrNumber;
  String get ivrNumber => _$this._ivrNumber;
  set ivrNumber(String ivrNumber) => _$this._ivrNumber = ivrNumber;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _firstName = _$v.firstName;
      _id = _$v.id;
      _emailId = _$v.emailId;
      _pin = _$v.pin;
      _address = _$v.address;
      _street = _$v.street;
      _password = _$v.password;
      _vehicleDetails = _$v.vehicleDetails;
      _amount = _$v.amount;
      _city = _$v.city;
      _userType = _$v.userType;
      _phoneNumber = _$v.phoneNumber;
      _ivrNumber = _$v.ivrNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            firstName: firstName,
            id: id,
            emailId: emailId,
            pin: pin,
            address: address,
            street: street,
            password: password,
            vehicleDetails: vehicleDetails,
            amount: amount,
            city: city,
            userType: userType,
            phoneNumber: phoneNumber,
            ivrNumber: ivrNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
