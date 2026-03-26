// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../domain/entities/file_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileResponseEntity {

 String get fileName; String get url;
/// Create a copy of FileResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileResponseEntityCopyWith<FileResponseEntity> get copyWith => _$FileResponseEntityCopyWithImpl<FileResponseEntity>(this as FileResponseEntity, _$identity);

  /// Serializes this FileResponseEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileResponseEntity&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,url);

@override
String toString() {
  return 'FileResponseEntity(fileName: $fileName, url: $url)';
}


}

/// @nodoc
abstract mixin class $FileResponseEntityCopyWith<$Res>  {
  factory $FileResponseEntityCopyWith(FileResponseEntity value, $Res Function(FileResponseEntity) _then) = _$FileResponseEntityCopyWithImpl;
@useResult
$Res call({
 String fileName, String url
});




}
/// @nodoc
class _$FileResponseEntityCopyWithImpl<$Res>
    implements $FileResponseEntityCopyWith<$Res> {
  _$FileResponseEntityCopyWithImpl(this._self, this._then);

  final FileResponseEntity _self;
  final $Res Function(FileResponseEntity) _then;

/// Create a copy of FileResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? url = null,}) {
  return _then(_self.copyWith(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileResponseEntity].
extension FileResponseEntityPatterns on FileResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _FileResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FileResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileResponseEntity() when $default != null:
return $default(_that.fileName,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  String url)  $default,) {final _that = this;
switch (_that) {
case _FileResponseEntity():
return $default(_that.fileName,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  String url)?  $default,) {final _that = this;
switch (_that) {
case _FileResponseEntity() when $default != null:
return $default(_that.fileName,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileResponseEntity implements FileResponseEntity {
  const _FileResponseEntity({required this.fileName, required this.url});
  factory _FileResponseEntity.fromJson(Map<String, dynamic> json) => _$FileResponseEntityFromJson(json);

@override final  String fileName;
@override final  String url;

/// Create a copy of FileResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileResponseEntityCopyWith<_FileResponseEntity> get copyWith => __$FileResponseEntityCopyWithImpl<_FileResponseEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileResponseEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileResponseEntity&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fileName,url);

@override
String toString() {
  return 'FileResponseEntity(fileName: $fileName, url: $url)';
}


}

/// @nodoc
abstract mixin class _$FileResponseEntityCopyWith<$Res> implements $FileResponseEntityCopyWith<$Res> {
  factory _$FileResponseEntityCopyWith(_FileResponseEntity value, $Res Function(_FileResponseEntity) _then) = __$FileResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 String fileName, String url
});




}
/// @nodoc
class __$FileResponseEntityCopyWithImpl<$Res>
    implements _$FileResponseEntityCopyWith<$Res> {
  __$FileResponseEntityCopyWithImpl(this._self, this._then);

  final _FileResponseEntity _self;
  final $Res Function(_FileResponseEntity) _then;

/// Create a copy of FileResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? url = null,}) {
  return _then(_FileResponseEntity(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
