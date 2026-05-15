import 'package:bkash_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void _demoTap(BuildContext context, String label) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label (Demo)')));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              color: AppColors.primary,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.person, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Prosenjit Sarker',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '01309646269',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _item(
                    context,
                    icon: Icons.account_circle_outlined,
                    label: 'My bKash',
                    onTap: () => _demoTap(context, 'My bKash'),
                  ),
                  _item(
                    context,
                    icon: Icons.local_offer_outlined,
                    label: 'Offers',
                    onTap: () => _demoTap(context, 'Offers'),
                  ),
                  _item(
                    context,
                    icon: Icons.receipt_long_outlined,
                    label: 'Statements',
                    onTap: () => _demoTap(context, 'Statements'),
                  ),
                  _item(
                    context,
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () => _demoTap(context, 'Settings'),
                  ),
                  const Divider(height: 1),
                  _item(
                    context,
                    icon: Icons.help_outline,
                    label: 'Help',
                    onTap: () => _demoTap(context, 'Help'),
                  ),
                  _item(
                    context,
                    icon: Icons.info_outline,
                    label: 'About',
                    onTap: () => _demoTap(context, 'About'),
                  ),
                  _item(
                    context,
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () => _demoTap(context, 'Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textDark),
      title: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

