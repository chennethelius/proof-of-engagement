/// Application configuration and environment setup
class AppConfig {
  // Solana Network Configuration
  static const String solanaNetwork = String.fromEnvironment(
    'SOLANA_NETWORK',
    defaultValue: 'devnet',
  );
  
  static const String solanaRpcUrl = String.fromEnvironment(
    'SOLANA_RPC_URL',
    defaultValue: 'https://api.devnet.solana.com',
  );
  
  // Program IDs (Deployed on Devnet)
  static const String proofOfEngagementProgramId = String.fromEnvironment(
    'PROGRAM_ID',
    defaultValue: 'DGMwn7z9fqvaDVXy7tuiXcjvUT8T94Hz5VuTyYo2RPGn',
  );
  
  // API Configuration
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
  
  // IPFS/Storage Configuration (for event images)
  static const String ipfsGateway = String.fromEnvironment(
    'IPFS_GATEWAY',
    defaultValue: 'https://ipfs.io/ipfs/',
  );
  
  // App Constants
  static const int qrCodeExpirySec = 300; // 5 minutes
  static const int maxEventImageSizeMB = 10;
  static const int leaderboardPageSize = 20;
  
  static Future<void> initialize() async {
    // Add any async initialization here
    // e.g., SharedPreferences, Firebase, etc.
  }
}
