// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Asset {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get changePercent => throw _privateConstructorUsedError;
  AssetType get type => throw _privateConstructorUsedError;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call({
    String id,
    String name,
    String symbol,
    double price,
    double changePercent,
    AssetType type,
  });
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
    Object? changePercent = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            changePercent: null == changePercent
                ? _value.changePercent
                : changePercent // ignore: cast_nullable_to_non_nullable
                      as double,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AssetType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
    _$AssetImpl value,
    $Res Function(_$AssetImpl) then,
  ) = __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String symbol,
    double price,
    double changePercent,
    AssetType type,
  });
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
    _$AssetImpl _value,
    $Res Function(_$AssetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? price = null,
    Object? changePercent = null,
    Object? type = null,
  }) {
    return _then(
      _$AssetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        changePercent: null == changePercent
            ? _value.changePercent
            : changePercent // ignore: cast_nullable_to_non_nullable
                  as double,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AssetType,
      ),
    );
  }
}

/// @nodoc

class _$AssetImpl implements _Asset {
  const _$AssetImpl({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercent,
    required this.type,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final double price;
  @override
  final double changePercent;
  @override
  final AssetType type;

  @override
  String toString() {
    return 'Asset(id: $id, name: $name, symbol: $symbol, price: $price, changePercent: $changePercent, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, symbol, price, changePercent, type);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);
}

abstract class _Asset implements Asset {
  const factory _Asset({
    required final String id,
    required final String name,
    required final String symbol,
    required final double price,
    required final double changePercent,
    required final AssetType type,
  }) = _$AssetImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get symbol;
  @override
  double get price;
  @override
  double get changePercent;
  @override
  AssetType get type;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
