import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto/crypto.dart';

/// Wallet connection state
class WalletState {
  final bool isConnected;
  final String? publicKey;
  final String? displayName;
  
  const WalletState({
    this.isConnected = false,
    this.publicKey,
    this.displayName,
  });
  
  WalletState copyWith({
    bool? isConnected,
    String? publicKey,
    String? displayName,
  }) {
    return WalletState(
      isConnected: isConnected ?? this.isConnected,
      publicKey: publicKey ?? this.publicKey,
      displayName: displayName ?? this.displayName,
    );
  }
}

/// Phantom wallet service
/// 
/// This service handles connection to Phantom wallet via deep links
/// Uses the Phantom mobile app's deep linking protocol
class PhantomWalletService extends StateNotifier<WalletState> {
  PhantomWalletService() : super(const WalletState()) {
    _loadSavedWallet();
  }
  
  // App URL scheme - must match Info.plist/AndroidManifest.xml
  static const String _appScheme = 'proofofengagement';
  static const String _redirectLink = '$_appScheme://onConnect';
  
  Future<void> _loadSavedWallet() async {
    final prefs = await SharedPreferences.getInstance();
    final publicKey = prefs.getString('wallet_public_key');
    final displayName = prefs.getString('wallet_display_name');
    
    if (publicKey != null) {
      state = WalletState(
        isConnected: true,
        publicKey: publicKey,
        displayName: displayName,
      );
    }
  }
  
  /// Connect to Phantom wallet via deep link
  /// 
  /// Opens Phantom app with connection request.
  /// In production, you would:
  /// 1. Generate encryption keypair
  /// 2. Build deep link URL
  /// 3. Launch Phantom app
  /// 4. Handle callback in app's deep link handler
  Future<bool> connect() async {
    try {
      // For MVP: Simulate connection
      // TODO: Implement actual Phantom deep link connection
      // 
      // Production flow:
      // 1. Generate session keypair for encryption
      // 2. Build URL: phantom://v1/connect?
      //    app_url=proofofengagement://&
      //    dapp_encryption_public_key=<base58_encoded_key>&
      //    redirect_link=proofofengagement://onConnect&
      //    cluster=devnet
      // 3. Launch URL
      // 4. Wait for callback with phantom_encryption_public_key & data
      // 5. Decrypt user's public key
      
      // Simulate delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock wallet data for development
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final mockPublicKey = _generateMockPublicKey(timestamp);
      
      // Save to preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('wallet_public_key', mockPublicKey);
      await prefs.setString('wallet_display_name', 'User ${mockPublicKey.substring(0, 8)}');
      
      state = WalletState(
        isConnected: true,
        publicKey: mockPublicKey,
        displayName: 'User ${mockPublicKey.substring(0, 8)}',
      );
      
      return true;
    } catch (e) {
      return false;
    }
  }
  
  /// Generate mock Solana public key (base58 format)
  String _generateMockPublicKey(int timestamp) {
    final bytes = utf8.encode('mock_wallet_$timestamp');
    final hash = sha256.convert(bytes);
    return hash.toString().substring(0, 44); // Solana pubkeys are 44 chars
  }
  
  /// Build Phantom deep link URL for production
  Uri _buildPhantomConnectUrl() {
    // Generate encryption keypair (simplified for demo)
    // In production: use ed25519 keypair generation
    final dappPublicKey = 'DEMO_PUBLIC_KEY'; // TODO: Generate real keypair
    
    return Uri.parse(
      'phantom://v1/connect'
      '?app_url=$_appScheme://'
      '&dapp_encryption_public_key=$dappPublicKey'
      '&redirect_link=$_redirectLink'
      '&cluster=devnet',
    );
  }
  
  /// Launch Phantom app (for production)
  Future<bool> _launchPhantom(Uri url) async {
    if (await canLaunchUrl(url)) {
      return await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
    return false;
  }
  
  /// Disconnect wallet
  Future<void> disconnect() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('wallet_public_key');
    await prefs.remove('wallet_display_name');
    
    state = const WalletState();
  }
  
  /// Sign a transaction
  /// 
  /// In production, this would send the transaction to Phantom
  /// for user approval and signing via deep link
  Future<String?> signTransaction(String transaction) async {
    if (!state.isConnected) {
      throw Exception('Wallet not connected');
    }
    
    try {
      // TODO: Implement actual transaction signing via deep link
      // phantom://v1/signTransaction?
      //   dapp_encryption_public_key=<key>&
      //   redirect_link=<redirect>&
      //   payload=<base58_encoded_transaction>
      
      await Future.delayed(const Duration(milliseconds: 500));
      return 'signature_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      return null;
    }
  }
  
  /// Sign a message
  Future<String?> signMessage(String message) async {
    if (!state.isConnected) {
      throw Exception('Wallet not connected');
    }
    
    try {
      // TODO: Implement actual message signing
      await Future.delayed(const Duration(milliseconds: 500));
      return 'signed_${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      return null;
    }
  }
}

final walletServiceProvider = StateNotifierProvider<PhantomWalletService, WalletState>((ref) {
  return PhantomWalletService();
});
