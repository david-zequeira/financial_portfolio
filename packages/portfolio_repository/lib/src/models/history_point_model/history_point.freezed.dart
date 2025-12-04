// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HistoryPoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Create a copy of HistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryPointCopyWith<HistoryPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPointCopyWith<$Res> {
  factory $HistoryPointCopyWith(
    HistoryPoint value,
    $Res Function(HistoryPoint) then,
  ) = _$HistoryPointCopyWithImpl<$Res, HistoryPoint>;
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class _$HistoryPointCopyWithImpl<$Res, $Val extends HistoryPoint>
    implements $HistoryPointCopyWith<$Res> {
  _$HistoryPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryPointImplCopyWith<$Res>
    implements $HistoryPointCopyWith<$Res> {
  factory _$$HistoryPointImplCopyWith(
    _$HistoryPointImpl value,
    $Res Function(_$HistoryPointImpl) then,
  ) = __$$HistoryPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class __$$HistoryPointImplCopyWithImpl<$Res>
    extends _$HistoryPointCopyWithImpl<$Res, _$HistoryPointImpl>
    implements _$$HistoryPointImplCopyWith<$Res> {
  __$$HistoryPointImplCopyWithImpl(
    _$HistoryPointImpl _value,
    $Res Function(_$HistoryPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? timestamp = null, Object? value = null}) {
    return _then(
      _$HistoryPointImpl(
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$HistoryPointImpl implements _HistoryPoint {
  const _$HistoryPointImpl({required this.timestamp, required this.value});

  @override
  final DateTime timestamp;
  @override
  final double value;

  @override
  String toString() {
    return 'HistoryPoint(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value);

  /// Create a copy of HistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryPointImplCopyWith<_$HistoryPointImpl> get copyWith =>
      __$$HistoryPointImplCopyWithImpl<_$HistoryPointImpl>(this, _$identity);
}

abstract class _HistoryPoint implements HistoryPoint {
  const factory _HistoryPoint({
    required final DateTime timestamp,
    required final double value,
  }) = _$HistoryPointImpl;

  @override
  DateTime get timestamp;
  @override
  double get value;

  /// Create a copy of HistoryPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryPointImplCopyWith<_$HistoryPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
