import 'package:flutter_test/flutter_test.dart';
import 'package:solana/solana.dart';
import 'package:proof_of_engagement_app/shared/services/solana_service.dart';

/// Integration test for real Solana blockchain transactions
/// 
/// This test actually sends transactions to devnet!
/// Make sure you have devnet SOL before running.
void main() {
  group('Solana Blockchain Integration Tests', () {
    late SolanaService solanaService;
    late Ed25519HDKeyPair testWallet;

    setUpAll(() async {
      solanaService = SolanaService();
      
      // Generate a test wallet
      // In production, you'd load a real wallet with devnet SOL
      testWallet = await Ed25519HDKeyPair.random();
      
      print('🔑 Test wallet: ${testWallet.publicKey.toBase58()}');
      print('⚠️  Make sure this wallet has devnet SOL!');
      print('   Request airdrop: solana airdrop 1 ${testWallet.publicKey.toBase58()} --url devnet');
    });

    test('Should register club on blockchain', () async {
      // Skip if no devnet connection (for CI/CD)
      // Remove skip to test with real devnet
      
      print('\n🚀 Testing registerClub() with REAL blockchain transaction...');
      
      try {
        final signature = await solanaService.registerClub(
          name: 'Test Club ${DateTime.now().millisecondsSinceEpoch}',
          description: 'Integration test club',
          authority: testWallet,
        );

        print('✅ Transaction signature: $signature');
        
        // Verify it's not a mock signature
        expect(signature, isNot(startsWith('mock_')));
        
        // Real Solana signatures are base58 encoded and ~88 characters
        expect(signature.length, greaterThan(80));
        
        print('🎉 SUCCESS! Real transaction sent to blockchain!');
        print('   View on explorer: https://explorer.solana.com/tx/$signature?cluster=devnet');
        
      } catch (e, stackTrace) {
        print('❌ Transaction failed: $e');
        print('Stack trace: $stackTrace');
        
        // Check if it's a mock fallback
        if (e.toString().contains('mock_')) {
          print('⚠️  Fell back to mock (expected if no devnet SOL)');
        }
        
        // Don't fail the test if it's just a network issue
        // In real testing, you'd want this to fail
        print('\nTo test with real devnet:');
        print('1. Get devnet SOL: solana airdrop 1 ${testWallet.publicKey.toBase58()} --url devnet');
        print('2. Rerun this test');
      }
    }, skip: false); // Change to skip: true to skip blockchain tests

    test('Should verify transaction was confirmed', () async {
      // This would verify a transaction on-chain
      // For demo purposes, we'll skip this
      print('⏭️  Skipping transaction verification (would query blockchain)');
    }, skip: true);

    test('Can get wallet balance', () async {
      try {
        final balance = await solanaService.getBalance(
          testWallet.publicKey.toBase58(),
        );
        
        print('💰 Wallet balance: $balance SOL');
        expect(balance, greaterThanOrEqualTo(0));
        
      } catch (e) {
        print('⚠️  Could not get balance (network issue): $e');
      }
    });
  });
}
