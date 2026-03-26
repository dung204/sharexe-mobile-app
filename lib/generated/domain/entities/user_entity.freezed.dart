// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entities/user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get id; DateTime get createdAt; String get role; String? get createdBy; DateTime? get lastModifiedAt; String? get lastModifiedBy; DateTime? get deletedAt; String? get email; String? get fullName; String? get gender; DateTime? get dateOfBirth; FileResponseEntity? get avatar;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.lastModifiedAt, lastModifiedAt) || other.lastModifiedAt == lastModifiedAt)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,role,createdBy,lastModifiedAt,lastModifiedBy,deletedAt,email,fullName,gender,dateOfBirth,avatar);

@override
String toString() {
  return 'UserEntity(id: $id, createdAt: $createdAt, role: $role, createdBy: $createdBy, lastModifiedAt: $lastModifiedAt, lastModifiedBy: $lastModifiedBy, deletedAt: $deletedAt, email: $email, fullName: $fullName, gender: $gender, dateOfBirth: $dateOfBirth, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, String role, String? createdBy, DateTime? lastModifiedAt, String? lastModifiedBy, DateTime? deletedAt, String? email, String? fullName, String? gender, DateTime? dateOfBirth, FileResponseEntity? avatar
});


$FileResponseEntityCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? role = null,Object? createdBy = freezed,Object? lastModifiedAt = freezed,Object? lastModifiedBy = freezed,Object? deletedAt = freezed,Object? email = freezed,Object? fullName = freezed,Object? gender = freezed,Object? dateOfBirth = freezed,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedAt: freezed == lastModifiedAt ? _self.lastModifiedAt : lastModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as FileResponseEntity?,
  ));
}
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileResponseEntityCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $FileResponseEntityCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  String role,  String? createdBy,  DateTime? lastModifiedAt,  String? lastModifiedBy,  DateTime? deletedAt,  String? email,  String? fullName,  String? gender,  DateTime? dateOfBirth,  FileResponseEntity? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.role,_that.createdBy,_that.lastModifiedAt,_that.lastModifiedBy,_that.deletedAt,_that.email,_that.fullName,_that.gender,_that.dateOfBirth,_that.avatar);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  String role,  String? createdBy,  DateTime? lastModifiedAt,  String? lastModifiedBy,  DateTime? deletedAt,  String? email,  String? fullName,  String? gender,  DateTime? dateOfBirth,  FileResponseEntity? avatar)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.createdAt,_that.role,_that.createdBy,_that.lastModifiedAt,_that.lastModifiedBy,_that.deletedAt,_that.email,_that.fullName,_that.gender,_that.dateOfBirth,_that.avatar);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  String role,  String? createdBy,  DateTime? lastModifiedAt,  String? lastModifiedBy,  DateTime? deletedAt,  String? email,  String? fullName,  String? gender,  DateTime? dateOfBirth,  FileResponseEntity? avatar)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.createdAt,_that.role,_that.createdBy,_that.lastModifiedAt,_that.lastModifiedBy,_that.deletedAt,_that.email,_that.fullName,_that.gender,_that.dateOfBirth,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.id, required this.createdAt, required this.role, this.createdBy, this.lastModifiedAt, this.lastModifiedBy, this.deletedAt, this.email, this.fullName, this.gender, this.dateOfBirth, this.avatar});
  

@override final  String id;
@override final  DateTime createdAt;
@override final  String role;
@override final  String? createdBy;
@override final  DateTime? lastModifiedAt;
@override final  String? lastModifiedBy;
@override final  DateTime? deletedAt;
@override final  String? email;
@override final  String? fullName;
@override final  String? gender;
@override final  DateTime? dateOfBirth;
@override final  FileResponseEntity? avatar;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.lastModifiedAt, lastModifiedAt) || other.lastModifiedAt == lastModifiedAt)&&(identical(other.lastModifiedBy, lastModifiedBy) || other.lastModifiedBy == lastModifiedBy)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,role,createdBy,lastModifiedAt,lastModifiedBy,deletedAt,email,fullName,gender,dateOfBirth,avatar);

@override
String toString() {
  return 'UserEntity(id: $id, createdAt: $createdAt, role: $role, createdBy: $createdBy, lastModifiedAt: $lastModifiedAt, lastModifiedBy: $lastModifiedBy, deletedAt: $deletedAt, email: $email, fullName: $fullName, gender: $gender, dateOfBirth: $dateOfBirth, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, String role, String? createdBy, DateTime? lastModifiedAt, String? lastModifiedBy, DateTime? deletedAt, String? email, String? fullName, String? gender, DateTime? dateOfBirth, FileResponseEntity? avatar
});


@override $FileResponseEntityCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? role = null,Object? createdBy = freezed,Object? lastModifiedAt = freezed,Object? lastModifiedBy = freezed,Object? deletedAt = freezed,Object? email = freezed,Object? fullName = freezed,Object? gender = freezed,Object? dateOfBirth = freezed,Object? avatar = freezed,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,lastModifiedAt: freezed == lastModifiedAt ? _self.lastModifiedAt : lastModifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastModifiedBy: freezed == lastModifiedBy ? _self.lastModifiedBy : lastModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as FileResponseEntity?,
  ));
}

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileResponseEntityCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $FileResponseEntityCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}

// dart format on
