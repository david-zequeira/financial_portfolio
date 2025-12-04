import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';

/// Enum representing the type of asset
enum AssetType {
  stock,
  etf,
  crypto,
  unspecified,
}

/// {@template asset}
/// A financial asset in the portfolio.
/// {@endtemplate}
@freezed
class Asset with _$Asset {
  /// {@macro asset}
  const factory Asset({
    required String id,
    required String name,
    required String symbol,
    required double price,
    required double changePercent,
    required AssetType type,
  }) = _Asset;
}

