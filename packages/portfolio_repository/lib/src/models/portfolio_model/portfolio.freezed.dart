// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Portfolio {
  double get totalBalance => throw _privateConstructorUsedError;
  List<Asset> get assets => throw _privateConstructorUsedError;
  List<HistoryPoint> get history => throw _privateConstructorUsedError;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioCopyWith<Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioCopyWith<$Res> {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) then) =
      _$PortfolioCopyWithImpl<$Res, Portfolio>;
  @useResult
  $Res call({
    double totalBalance,
    List<Asset> assets,
    List<HistoryPoint> history,
  });
}

/// @nodoc
class _$PortfolioCopyWithImpl<$Res, $Val extends Portfolio>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? assets = null,
    Object? history = null,
  }) {
    return _then(
      _value.copyWith(
            totalBalance: null == totalBalance
                ? _value.totalBalance
                : totalBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            assets: null == assets
                ? _value.assets
                : assets // ignore: cast_nullable_to_non_nullable
                      as List<Asset>,
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as List<HistoryPoint>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortfolioImplCopyWith<$Res>
    implements $PortfolioCopyWith<$Res> {
  factory _$$PortfolioImplCopyWith(
    _$PortfolioImpl value,
    $Res Function(_$PortfolioImpl) then,
  ) = __$$PortfolioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalBalance,
    List<Asset> assets,
    List<HistoryPoint> history,
  });
}

/// @nodoc
class __$$PortfolioImplCopyWithImpl<$Res>
    extends _$PortfolioCopyWithImpl<$Res, _$PortfolioImpl>
    implements _$$PortfolioImplCopyWith<$Res> {
  __$$PortfolioImplCopyWithImpl(
    _$PortfolioImpl _value,
    $Res Function(_$PortfolioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBalance = null,
    Object? assets = null,
    Object? history = null,
  }) {
    return _then(
      _$PortfolioImpl(
        totalBalance: null == totalBalance
            ? _value.totalBalance
            : totalBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        assets: null == assets
            ? _value._assets
            : assets // ignore: cast_nullable_to_non_nullable
                  as List<Asset>,
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<HistoryPoint>,
      ),
    );
  }
}

/// @nodoc

class _$PortfolioImpl implements _Portfolio {
  const _$PortfolioImpl({
    required this.totalBalance,
    required final List<Asset> assets,
    required final List<HistoryPoint> history,
  }) : _assets = assets,
       _history = history;

  @override
  final double totalBalance;
  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  final List<HistoryPoint> _history;
  @override
  List<HistoryPoint> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  String toString() {
    return 'Portfolio(totalBalance: $totalBalance, assets: $assets, history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioImpl &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBalance,
    const DeepCollectionEquality().hash(_assets),
    const DeepCollectionEquality().hash(_history),
  );

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      __$$PortfolioImplCopyWithImpl<_$PortfolioImpl>(this, _$identity);
}

abstract class _Portfolio implements Portfolio {
  const factory _Portfolio({
    required final double totalBalance,
    required final List<Asset> assets,
    required final List<HistoryPoint> history,
  }) = _$PortfolioImpl;

  @override
  double get totalBalance;
  @override
  List<Asset> get assets;
  @override
  List<HistoryPoint> get history;

  /// Create a copy of Portfolio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
