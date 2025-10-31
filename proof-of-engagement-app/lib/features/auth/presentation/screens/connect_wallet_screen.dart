import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/services/wallet_service.dart';
import 'seed_phrase_backup_screen.dart';

class ConnectWalletScreen extends ConsumerWidget {
  const ConnectWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletService = ref.read(walletServiceProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Proof of Engagement',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Connect your wallet to get started',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              
              // Student Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final mnemonic = await walletService.generateNewWallet();
                    if (mnemonic != null && context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeedPhraseBackupScreen(
                            seedPhrase: mnemonic,
                            destination: 'student-home',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Student Login'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Club Login Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final mnemonic = await walletService.generateNewWallet();
                    if (mnemonic != null && context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeedPhraseBackupScreen(
                            seedPhrase: mnemonic,
                            destination: 'club-home',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.groups),
                  label: const Text('Club Login'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
