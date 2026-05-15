import 'package:bkash_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text(
                'Services',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 6),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          const Icon(Icons.notifications_none, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
