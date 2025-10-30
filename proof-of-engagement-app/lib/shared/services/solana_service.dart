import 'package:solana/solana.dart';
import '../../../core/config/app_config.dart';

class SolanaService {
  late final SolanaClient _client;
  late final RpcClient _rpcClient;
  
  SolanaService() {
    _rpcClient = RpcClient(AppConfig.solanaRpcUrl);
    _client = SolanaClient(
      rpcUrl: Uri.parse(AppConfig.solanaRpcUrl),
      websocketUrl: Uri.parse(AppConfig.solanaRpcUrl.replaceFirst('https', 'wss')),
    );
  }
  
  /// Get SOL balance for a wallet
  Future<double> getBalance(String publicKey) async {
    try {
      final balance = await _client.rpcClient.getBalance(publicKey);
      return balance.value / lamportsPerSol;
    } catch (e) {
      throw Exception('Failed to get balance: $e');
    }
  }
  
  /// Create a club on-chain
  Future<String> createClub({
    required String clubName,
    required String clubDescription,
    required String walletPublicKey,
  }) async {
    try {
      // This will interact with your Solana program
      // For now, returning a mock transaction hash
      // TODO: Implement actual program instruction
      
      return 'mock_tx_hash_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      throw Exception('Failed to create club: $e');
    }
  }
  
  /// Record event on-chain
  Future<String> recordEvent({
    required String eventId,
    required String clubId,
    required String walletPublicKey,
  }) async {
    try {
      // TODO: Implement actual program instruction
      return 'mock_tx_hash_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      throw Exception('Failed to record event: $e');
    }
  }
  
  /// Record attendance on-chain
  Future<String> recordAttendance({
    required String eventId,
    required String userWallet,
    required String clubWallet,
  }) async {
    try {
      // TODO: Implement actual program instruction
      return 'mock_tx_hash_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      throw Exception('Failed to record attendance: $e');
    }
  }
  
  /// Verify transaction
  Future<bool> verifyTransaction(String signature) async {
    try {
      final status = await _client.rpcClient.getSignatureStatuses([signature]);
      // Check if transaction is confirmed
      return status.value.first != null;
    } catch (e) {
      return false;
    }
  }
  
  void dispose() {
    // Cleanup if needed
  }
}
