import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_repository/src/models/asset_model/asset.dart';
import 'package:portfolio_repository/src/models/history_point_model/history_point.dart';

part 'portfolio.freezed.dart';

/// {@template portfolio}
/// The user's financial portfolio containing assets and history.
/// {@endtemplate}
@freezed
class Portfolio with _$Portfolio {
  /// {@macro portfolio}
  const factory Portfolio({
    required double totalBalance,
    required List<Asset> assets,
    required List<HistoryPoint> history,
  }) = _Portfolio;
}
