// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../presentation/modules/home/cubit/home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Ready value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Ready value)  ready,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Ready():
return ready(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Ready value)?  ready,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( LatLng currentLocation,  List<HubEntity> hubs,  HubEntity? startHub,  HubEntity? endHub,  RouteEntity? currentRoute,  HubEntity? selectedHub)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Ready() when ready != null:
return ready(_that.currentLocation,_that.hubs,_that.startHub,_that.endHub,_that.currentRoute,_that.selectedHub);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( LatLng currentLocation,  List<HubEntity> hubs,  HubEntity? startHub,  HubEntity? endHub,  RouteEntity? currentRoute,  HubEntity? selectedHub)  ready,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.message);case _Ready():
return ready(_that.currentLocation,_that.hubs,_that.startHub,_that.endHub,_that.currentRoute,_that.selectedHub);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( LatLng currentLocation,  List<HubEntity> hubs,  HubEntity? startHub,  HubEntity? endHub,  RouteEntity? currentRoute,  HubEntity? selectedHub)?  ready,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Ready() when ready != null:
return ready(_that.currentLocation,_that.hubs,_that.startHub,_that.endHub,_that.currentRoute,_that.selectedHub);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _Loading implements HomeState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class _Error implements HomeState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Ready implements HomeState {
  const _Ready({required this.currentLocation, final  List<HubEntity> hubs = const [], this.startHub, this.endHub, this.currentRoute, this.selectedHub}): _hubs = hubs;
  

 final  LatLng currentLocation;
 final  List<HubEntity> _hubs;
@JsonKey() List<HubEntity> get hubs {
  if (_hubs is EqualUnmodifiableListView) return _hubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hubs);
}

 final  HubEntity? startHub;
 final  HubEntity? endHub;
 final  RouteEntity? currentRoute;
 final  HubEntity? selectedHub;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&const DeepCollectionEquality().equals(other._hubs, _hubs)&&(identical(other.startHub, startHub) || other.startHub == startHub)&&(identical(other.endHub, endHub) || other.endHub == endHub)&&(identical(other.currentRoute, currentRoute) || other.currentRoute == currentRoute)&&(identical(other.selectedHub, selectedHub) || other.selectedHub == selectedHub));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,const DeepCollectionEquality().hash(_hubs),startHub,endHub,currentRoute,selectedHub);

@override
String toString() {
  return 'HomeState.ready(currentLocation: $currentLocation, hubs: $hubs, startHub: $startHub, endHub: $endHub, currentRoute: $currentRoute, selectedHub: $selectedHub)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 LatLng currentLocation, List<HubEntity> hubs, HubEntity? startHub, HubEntity? endHub, RouteEntity? currentRoute, HubEntity? selectedHub
});


$HubEntityCopyWith<$Res>? get startHub;$HubEntityCopyWith<$Res>? get endHub;$HubEntityCopyWith<$Res>? get selectedHub;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentLocation = null,Object? hubs = null,Object? startHub = freezed,Object? endHub = freezed,Object? currentRoute = freezed,Object? selectedHub = freezed,}) {
  return _then(_Ready(
currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng,hubs: null == hubs ? _self._hubs : hubs // ignore: cast_nullable_to_non_nullable
as List<HubEntity>,startHub: freezed == startHub ? _self.startHub : startHub // ignore: cast_nullable_to_non_nullable
as HubEntity?,endHub: freezed == endHub ? _self.endHub : endHub // ignore: cast_nullable_to_non_nullable
as HubEntity?,currentRoute: freezed == currentRoute ? _self.currentRoute : currentRoute // ignore: cast_nullable_to_non_nullable
as RouteEntity?,selectedHub: freezed == selectedHub ? _self.selectedHub : selectedHub // ignore: cast_nullable_to_non_nullable
as HubEntity?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HubEntityCopyWith<$Res>? get startHub {
    if (_self.startHub == null) {
    return null;
  }

  return $HubEntityCopyWith<$Res>(_self.startHub!, (value) {
    return _then(_self.copyWith(startHub: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HubEntityCopyWith<$Res>? get endHub {
    if (_self.endHub == null) {
    return null;
  }

  return $HubEntityCopyWith<$Res>(_self.endHub!, (value) {
    return _then(_self.copyWith(endHub: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HubEntityCopyWith<$Res>? get selectedHub {
    if (_self.selectedHub == null) {
    return null;
  }

  return $HubEntityCopyWith<$Res>(_self.selectedHub!, (value) {
    return _then(_self.copyWith(selectedHub: value));
  });
}
}

// dart format on
