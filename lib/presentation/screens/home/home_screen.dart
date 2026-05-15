import 'package:bkash_app/core/app_colors.dart';
import 'package:bkash_app/presentation/provider/home_provider.dart';
import 'package:bkash_app/presentation/screens/home/widget/home_app_bar.dart';
import 'package:bkash_app/presentation/screens/home/widget/home_drawer.dart';
import 'package:bkash_app/presentation/screens/home/widget/menu_bar.dart';
import 'package:bkash_app/presentation/screens/home/widget/menu_grid.dart';
import 'package:bkash_app/presentation/screens/home/widget/promotional_banner.dart';
import 'package:bkash_app/presentation/screens/home/widget/quick_features_widget.dart';
import 'package:bkash_app/presentation/screens/home/widget/transactions_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: 'Menu',
            );
          },
        ),
        title: const HomeAppBar(),
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              spacing: 0,
              children: [
                // Secondary menu bar (services/notifications)
                const HomeMenuBar(),
                // Promotional carousel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const PromotionalBanner(),
                ),
                const SizedBox(height: 8),
                MenuGrid(),
                const QuickFeaturesWidget(),
                TransactionsWidget(transactions: provider.transactions),
                Image.asset(
                  'assets/offfer_banner.png',
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      color: AppColors.lightGrey,
                      child: const Center(child: Text('Offers Banner')),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}
