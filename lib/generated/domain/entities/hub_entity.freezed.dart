// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entities/hub_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HubEntity {

 String get id; String get name; String get address; double get latitude; double get longitude; String? get description; String? get imageUrl;
/// Create a copy of HubEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HubEntityCopyWith<HubEntity> get copyWith => _$HubEntityCopyWithImpl<HubEntity>(this as HubEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HubEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,description,imageUrl);

@override
String toString() {
  return 'HubEntity(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $HubEntityCopyWith<$Res>  {
  factory $HubEntityCopyWith(HubEntity value, $Res Function(HubEntity) _then) = _$HubEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, double latitude, double longitude, String? description, String? imageUrl
});




}
/// @nodoc
class _$HubEntityCopyWithImpl<$Res>
    implements $HubEntityCopyWith<$Res> {
  _$HubEntityCopyWithImpl(this._self, this._then);

  final HubEntity _self;
  final $Res Function(HubEntity) _then;

/// Create a copy of HubEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? description = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HubEntity].
extension HubEntityPatterns on HubEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HubEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HubEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HubEntity value)  $default,){
final _that = this;
switch (_that) {
case _HubEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HubEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HubEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude,  String? description,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HubEntity() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  double latitude,  double longitude,  String? description,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _HubEntity():
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.description,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  double latitude,  double longitude,  String? description,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _HubEntity() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.latitude,_that.longitude,_that.description,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _HubEntity extends HubEntity {
  const _HubEntity({required this.id, required this.name, required this.address, required this.latitude, required this.longitude, this.description, this.imageUrl}): super._();
  

@override final  String id;
@override final  String name;
@override final  String address;
@override final  double latitude;
@override final  double longitude;
@override final  String? description;
@override final  String? imageUrl;

/// Create a copy of HubEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HubEntityCopyWith<_HubEntity> get copyWith => __$HubEntityCopyWithImpl<_HubEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HubEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,latitude,longitude,description,imageUrl);

@override
String toString() {
  return 'HubEntity(id: $id, name: $name, address: $address, latitude: $latitude, longitude: $longitude, description: $description, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HubEntityCopyWith<$Res> implements $HubEntityCopyWith<$Res> {
  factory _$HubEntityCopyWith(_HubEntity value, $Res Function(_HubEntity) _then) = __$HubEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, double latitude, double longitude, String? description, String? imageUrl
});




}
/// @nodoc
class __$HubEntityCopyWithImpl<$Res>
    implements _$HubEntityCopyWith<$Res> {
  __$HubEntityCopyWithImpl(this._self, this._then);

  final _HubEntity _self;
  final $Res Function(_HubEntity) _then;

/// Create a copy of HubEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? latitude = null,Object? longitude = null,Object? description = freezed,Object? imageUrl = freezed,}) {
  return _then(_HubEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
