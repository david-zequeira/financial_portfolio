import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_point.freezed.dart';

/// {@template history_point}
/// A point in the portfolio history graph.
/// {@endtemplate}
@freezed
class HistoryPoint with _$HistoryPoint {
  /// {@macro history_point}
  const factory HistoryPoint({
    required DateTime timestamp,
    required double value,
  }) = _HistoryPoint;
}

