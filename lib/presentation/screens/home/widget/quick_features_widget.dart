import 'package:bkash_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class QuickFeaturesWidget extends StatelessWidget {
  const QuickFeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'Quick Features',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _quickFeatureCard('My Offers', Icons.local_offer),
              const SizedBox(width: 12),
              _quickFeatureCard('Coupons', Icons.confirmation_number),
              const SizedBox(width: 12),
              _quickFeatureCard('Rewards', Icons.card_giftcard),
              const SizedBox(width: 12),
              _quickFeatureCard('Help', Icons.help_outline),
            ],
          ),
        ),
      ],
    );
  }

  Widget _quickFeatureCard(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.quickCardBg,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2, offset: const Offset(0, 1))],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
