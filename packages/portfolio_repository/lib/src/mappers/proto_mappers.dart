import 'package:portfolio_api/portfolio_api.dart' as api;
import 'package:portfolio_repository/src/models/models.dart';

/// Extension to map Proto Asset to Domain Asset
extension AssetProtoX on api.Asset {
  /// Converts a Proto Asset to a Domain Asset
  Asset toDomain() {
    return Asset(
      id: id,
      name: name,
      symbol: symbol,
      price: price,
      changePercent: changePercent,
      type: type.toDomain(),
    );
  }
}

/// Extension to map Proto AssetType to Domain AssetType
extension AssetTypeProtoX on api.AssetType {
  /// Converts a Proto AssetType to a Domain AssetType
  AssetType toDomain() {
    switch (this) {
      case api.AssetType.ASSET_TYPE_STOCK:
        return AssetType.stock;
      case api.AssetType.ASSET_TYPE_ETF:
        return AssetType.etf;
      case api.AssetType.ASSET_TYPE_CRYPTO:
        return AssetType.crypto;
      case api.AssetType.ASSET_TYPE_UNSPECIFIED:
      default:
        return AssetType.unspecified;
    }
  }
}

/// Extension to map Proto HistoryPoint to Domain HistoryPoint
extension HistoryPointProtoX on api.HistoryPoint {
  /// Converts a Proto HistoryPoint to a Domain HistoryPoint
  HistoryPoint toDomain() {
    return HistoryPoint(
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        timestamp.toInt() * 1000,
      ),
      value: value,
    );
  }
}

/// Extension to map Proto PortfolioResponse to Domain Portfolio
extension PortfolioResponseProtoX on api.PortfolioResponse {
  /// Converts a Proto PortfolioResponse to a Domain Portfolio
  Portfolio toDomain() => Portfolio(
    totalBalance: totalBalance,
    assets: assets.map((a) => a.toDomain()).toList(),
    history: history.map((h) => h.toDomain()).toList(),
  );
}
