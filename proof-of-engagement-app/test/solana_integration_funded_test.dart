import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:solana/solana.dart';
import 'package:proof_of_engagement_app/shared/services/solana_service.dart';

/// Integration test using the funded test wallet from test_blockchain.sh
/// 
/// This test uses the wallet at ./test-wallet.json which should have devnet SOL
void main() {
  group('Solana Blockchain Integration Tests (Funded)', () {
    late SolanaService solanaService;
    late Ed25519HDKeyPair testWallet;

    setUpAll(() async {
      solanaService = SolanaService();
      
      // Load the funded test wallet
      final walletFile = File('./test-wallet.json');
      
      if (!walletFile.existsSync()) {
        fail('Test wallet not found! Run ./test_blockchain.sh first to create a funded wallet.');
      }
      
      final walletJson = await walletFile.readAsString();
      final walletData = jsonDecode(walletJson) as List<dynamic>;
      final keypairBytes = Uint8List.fromList(walletData.cast<int>());
      
      // The JSON contains the full 64-byte keypair [secret_key(32), public_key(32)]
      // We need only the first 32 bytes (the seed/secret key)
      final seedBytes = keypairBytes.sublist(0, 32);
      
      testWallet = await Ed25519HDKeyPair.fromPrivateKeyBytes(
        privateKey: seedBytes,
      );
      
      print('🔑 Test wallet: ${testWallet.publicKey.toBase58()}');
      print('💰 Checking balance...');
      
      final balance = await solanaService.getBalance(
        testWallet.publicKey.toBase58(),
      );
      print('   Balance: $balance SOL');
      
      if (balance < 0.1) {
        print('⚠️  WARNING: Low balance! Request airdrop:');
        print('   solana airdrop 1 ${testWallet.publicKey.toBase58()} --url devnet');
      }
    });

    test('Should register club on blockchain with REAL transaction', () async {
      print('\n🚀 Testing registerClub() with REAL blockchain transaction...');
      print('   Wallet: ${testWallet.publicKey.toBase58()}');
      
      final signature = await solanaService.registerClub(
        name: 'Test Club ${DateTime.now().millisecondsSinceEpoch}',
        description: 'Integration test club from funded wallet',
        authority: testWallet,
      );

      print('✅ Transaction signature: $signature');
      
      // Verify it's not a mock signature
      expect(signature, isNot(startsWith('mock_')));
      
      // Real Solana signatures are base58 encoded and ~88 characters
      expect(signature.length, greaterThan(80));
      
      print('🎉 SUCCESS! Real transaction sent to blockchain!');
      print('   View on explorer: https://explorer.solana.com/tx/$signature?cluster=devnet');
    });

    test('Can get wallet balance', () async {
      final balance = await solanaService.getBalance(
        testWallet.publicKey.toBase58(),
      );
      
      print('💰 Final wallet balance: $balance SOL');
      expect(balance, greaterThanOrEqualTo(0));
    });
  });
}
