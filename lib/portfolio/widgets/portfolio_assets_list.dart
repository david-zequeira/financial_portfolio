import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_repository/portfolio_repository.dart';

class PortfolioAssetsList extends StatelessWidget {
  const PortfolioAssetsList({
    required this.assets,
    super.key,
  });

  final List<Asset> assets;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final asset = assets[index];
          return _AssetTile(asset: asset);
        },
        childCount: assets.length,
      ),
    );
  }
}

class _AssetTile extends StatelessWidget {
  const _AssetTile({required this.asset});

  final Asset asset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = asset.changePercent >= 0;
    final changeColor = isPositive ? AppColors.green : AppColors.red;

    return ListTile(
      contentPadding: AppInsets.hMd,
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        child: Text(
          asset.symbol.isNotEmpty ? asset.symbol.substring(0, 1) : '?',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        asset.name,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(asset.symbol),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$${asset.price.toStringAsFixed(2)}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold),
          ),
          Text(
            '${isPositive ? '+' : ''}${asset.changePercent.toStringAsFixed(2)}%',
            style: theme.textTheme.bodySmall?.copyWith(
              color: changeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

