import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({required this.balance, super.key});  
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppInsets.md,
        child: Column(
          children: [
            const Text('Total Balance', style: TextStyle(fontSize: 16)),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}