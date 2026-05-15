import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/core/app_strings.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.white,
          child: Icon(Icons.person, color: AppColors.primary),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.userName,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const _BalanceCheck(),
            ],
          ),
        ),
      ],
    );
  }
}

class _BalanceCheck extends StatelessWidget {
  const _BalanceCheck();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: const BorderRadius.all(Radius.elliptical(5, 5))),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            child: const Center(
              child: Text(
                '৳',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Text(AppStrings.tapForBalance, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
