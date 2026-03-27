import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_cubit.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_state.dart';
import 'package:sharexe/presentation/shared/user_avatar.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      child: Column(children: [_buildHeader(context), _buildBody(context)]),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      child: Stack(
        children: [
          Assets.images.drawerHeader.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state.maybeWhen(
                authenticated: (user) => Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UserAvatar(
                        radius: 50,
                        borderWidth: 2.0,
                        borderColor: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user.fullName ?? 'User Name',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildBalanceWidget(context, 2500),
                    ],
                  ),
                ),
                orElse: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceWidget(BuildContext context, double balance) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Cash',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(width: 8),

          Text(
            balance.toStringAsFixed(0),
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          children: [
            _buildDrawerItem(
              context,
              icon: Icons.account_balance_wallet_outlined,
              text: 'My Wallet',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.history,
              text: 'History',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.notifications_none_outlined,
              text: 'Notifications',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.card_giftcard_outlined,
              text: 'Invite Friends',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings_outlined,
              text: 'Settings',
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.logout_outlined,
              text: 'Sign Out',
              onTap: () => {
                context.read<AuthCubit>().signOut(),
                Navigator.pop(context),
              },
              danger: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool danger = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: danger ? Colors.red : Colors.grey[700],
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: danger ? Colors.red : Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 10,
    );
  }
}
