import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/services/wallet_service.dart';
import '../../../../core/theme/tokens/tokens.dart';
import '../../../../core/theme/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletState = ref.watch(walletServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Proof of Engagement',
          style: AppTypography.titleLarge(context),
        ),
        actions: [
          IconButton(
            icon: Icon(AppIcons.profile, size: AppIconSize.md),
            onPressed: () => context.push('/profile'),
          ),
          SizedBox(width: AppSpacing.sm),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPaddingResponsive(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Card with Gradient
              AppAnimations.fadeIn(
                child: AppCard.gradient(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            walletState.displayName?.substring(0, 2).toUpperCase() ?? 'U',
                            style: AppTypography.headlineSmall(context).copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back!',
                              style: AppTypography.titleMedium(context).copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: AppSpacing.xs),
                            Text(
                              walletState.publicKey?.substring(0, 20) ?? 'Connect Wallet',
                              style: AppTypography.bodySmall(context).copyWith(
                                color: AppColors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        AppIcons.wallet,
                        color: AppColors.white,
                        size: AppIconSize.lg,
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: AppSpacing.xl),
              
              // Quick Actions Section
              Text(
                'Quick Actions',
                style: AppTypography.headlineSmall(context),
              ),
              SizedBox(height: AppSpacing.md),
              
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: context.isMobile ? 2 : 4,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                children: [
                  _buildActionCard(
                    context,
                    icon: AppIcons.clubs,
                    title: 'Clubs',
                    gradient: LinearGradient(
                      colors: [AppColors.primaryPurple, AppColors.primaryPurpleLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () => context.push('/clubs'),
                  ),
                  _buildActionCard(
                    context,
                    icon: AppIcons.events,
                    title: 'Events',
                    gradient: LinearGradient(
                      colors: [AppColors.secondaryGreen, AppColors.secondaryGreenLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () => context.push('/events'),
                  ),
                  _buildActionCard(
                    context,
                    icon: AppIcons.leaderboard,
                    title: 'Leaderboard',
                    gradient: LinearGradient(
                      colors: [AppColors.accentBlue, Color(0xFF6BB8FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () => context.push('/leaderboard'),
                  ),
                  _buildActionCard(
                    context,
                    icon: AppIcons.qrScan,
                    title: 'Scan QR',
                    gradient: LinearGradient(
                      colors: [AppColors.accentPink, Color(0xFFFF94D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () => context.push('/scan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return AnimatedAppCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppIconSize.responsive(context, AppIconSize.xxxl),
              color: AppColors.white,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.titleMedium(context).copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
