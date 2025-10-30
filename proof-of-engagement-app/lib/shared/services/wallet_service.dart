import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solana/solana.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:bs58check/bs58check.dart' as bs58;
import '../../core/config/app_config.dart';

/// Wallet state
class WalletState {
  final bool isConnected;
  final String? publicKey;
  final String? displayName;
  final double balance;
  final WalletType walletType;

  const WalletState({
    this.isConnected = false,
    this.publicKey,
    this.displayName,
    this.balance = 0.0,
    this.walletType = WalletType.none,
  });

  WalletState copyWith({
    bool? isConnected,
    String? publicKey,
    String? displayName,
    double? balance,
    WalletType? walletType,
  }) {
    return WalletState(
      isConnected: isConnected ?? this.isConnected,
      publicKey: publicKey ?? this.publicKey,
      displayName: displayName ?? this.displayName,
      balance: balance ?? this.balance,
      walletType: walletType ?? this.walletType,
    );
  }
}

enum WalletType {
  none,
  generated,
  imported,
  phantom,
}

class WalletService extends StateNotifier<WalletState> {
  WalletService(this._solanaClient) : super(const WalletState()) {
    _loadSavedWallet();
  }

  final SolanaClient _solanaClient;
  Ed25519HDKeyPair? _currentKeyPair;
  Uint8List? _privateKeyBytes;

  static const String _keyPublicKey = 'wallet_public_key';
  static const String _keyPrivateKey = 'wallet_private_key_encrypted';
  static const String _keyDisplayName = 'wallet_display_name';
  static const String _keyWalletType = 'wallet_type';
  static const String _keySeedPhrase = 'wallet_seed_phrase_encrypted';

  Future<void> _loadSavedWallet() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final publicKey = prefs.getString(_keyPublicKey);
      final privateKeyHex = prefs.getString(_keyPrivateKey);
      final displayName = prefs.getString(_keyDisplayName);
      final walletTypeStr = prefs.getString(_keyWalletType);

      if (publicKey != null && privateKeyHex != null) {
        final privateKeyBytes = _hexToBytes(privateKeyHex);
        _privateKeyBytes = privateKeyBytes;
        
        _currentKeyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(
          privateKey: privateKeyBytes,
        );

        final walletType = _parseWalletType(walletTypeStr);

        state = WalletState(
          isConnected: true,
          publicKey: publicKey,
          displayName: displayName ?? 'Wallet \${publicKey.substring(0, 8)}',
          walletType: walletType,
        );

        await refreshBalance();
      }
    } catch (e) {
      debugPrint('Error loading saved wallet: \$e');
    }
  }

  Future<String?> generateNewWallet() async {
    try {
      final mnemonic = bip39.generateMnemonic();
      final seed = bip39.mnemonicToSeed(mnemonic);
      final derivedKey = await ED25519_HD_KEY.derivePath("m/44'/501'/0'/0'", seed);

      _privateKeyBytes = Uint8List.fromList(derivedKey.key);
      _currentKeyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: _privateKeyBytes!);
      final publicKey = _currentKeyPair!.publicKey.toBase58();

      await _saveWallet(publicKey: publicKey, privateKeyBytes: _privateKeyBytes!, seedPhrase: mnemonic, walletType: WalletType.generated);

      state = state.copyWith(isConnected: true, publicKey: publicKey, displayName: 'Wallet \${publicKey.substring(0, 8)}', walletType: WalletType.generated);
      await refreshBalance();

      return mnemonic;
    } catch (e) {
      debugPrint('Error generating wallet: \$e');
      return null;
    }
  }

  Future<bool> importFromSeedPhrase(String seedPhrase) async {
    try {
      if (!bip39.validateMnemonic(seedPhrase.trim())) return false;

      final seed = bip39.mnemonicToSeed(seedPhrase.trim());
      final derivedKey = await ED25519_HD_KEY.derivePath("m/44'/501'/0'/0'", seed);

      _privateKeyBytes = Uint8List.fromList(derivedKey.key);
      _currentKeyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: _privateKeyBytes!);
      final publicKey = _currentKeyPair!.publicKey.toBase58();

      await _saveWallet(publicKey: publicKey, privateKeyBytes: _privateKeyBytes!, seedPhrase: seedPhrase.trim(), walletType: WalletType.imported);

      state = state.copyWith(isConnected: true, publicKey: publicKey, displayName: 'Wallet \${publicKey.substring(0, 8)}', walletType: WalletType.imported);
      await refreshBalance();
      return true;
    } catch (e) {
      debugPrint('Error importing from seed phrase: \$e');
      return false;
    }
  }

  Future<bool> importFromPrivateKey(String privateKeyBase58) async {
    try {
      final privateKeyBytes = Uint8List.fromList(bs58.base58.decode(privateKeyBase58));
      _privateKeyBytes = privateKeyBytes;
      _currentKeyPair = await Ed25519HDKeyPair.fromPrivateKeyBytes(privateKey: privateKeyBytes);
      final publicKey = _currentKeyPair!.publicKey.toBase58();

      await _saveWallet(publicKey: publicKey, privateKeyBytes: privateKeyBytes, walletType: WalletType.imported);

      state = state.copyWith(isConnected: true, publicKey: publicKey, displayName: 'Wallet \${publicKey.substring(0, 8)}', walletType: WalletType.imported);
      await refreshBalance();
      return true;
    } catch (e) {
      debugPrint('Error importing from private key: \$e');
      return false;
    }
  }

  Future<Signature> signTransaction(Message message, String recentBlockhash) async {
    if (_currentKeyPair == null || _privateKeyBytes == null) {
      throw Exception('No wallet connected');
    }

    final compiledMessage = message.compile(recentBlockhash: recentBlockhash, feePayer: _currentKeyPair!.publicKey);
    final signature = await _currentKeyPair!.sign(compiledMessage.toByteArray());
    return signature;
  }

  Future<Signature> signMessage(String message) async {
    if (_currentKeyPair == null) throw Exception('No wallet connected');

    final messageBytes = Uint8List.fromList(utf8.encode(message));
    return await _currentKeyPair!.sign(messageBytes);
  }

  Ed25519HDKeyPair? get keypair => _currentKeyPair;
  Ed25519HDPublicKey? get publicKeyObj => _currentKeyPair?.publicKey;

  Future<void> refreshBalance() async {
    if (state.publicKey == null) return;

    try {
      final balance = await _solanaClient.rpcClient.getBalance(state.publicKey!, commitment: Commitment.confirmed);
      state = state.copyWith(balance: balance.value / lamportsPerSol);
    } catch (e) {
      debugPrint('Error fetching balance: \$e');
    }
  }

  Future<String?> exportSeedPhrase() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keySeedPhrase);
    } catch (e) {
      debugPrint('Error exporting seed phrase: \$e');
      return null;
    }
  }

  Future<String?> exportPrivateKey() async {
    if (_privateKeyBytes == null) return null;

    try {
      return bs58.base58.encode(_privateKeyBytes!);
    } catch (e) {
      debugPrint('Error exporting private key: \$e');
      return null;
    }
  }

  Future<bool> requestAirdrop({int lamports = lamportsPerSol}) async {
    if (state.publicKey == null) return false;

    try {
      await _solanaClient.rpcClient.requestAirdrop(state.publicKey!, lamports);
      await Future.delayed(const Duration(seconds: 2));
      await refreshBalance();
      return true;
    } catch (e) {
      debugPrint('Error requesting airdrop: $e');
      return false;
    }
  }

  Future<void> deleteWallet() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyPublicKey);
      await prefs.remove(_keyPrivateKey);
      await prefs.remove(_keyDisplayName);
      await prefs.remove(_keyWalletType);
      await prefs.remove(_keySeedPhrase);

      _currentKeyPair = null;
      _privateKeyBytes = null;
      state = const WalletState();
    } catch (e) {
      debugPrint('Error deleting wallet: \$e');
    }
  }

  Future<void> _saveWallet({required String publicKey, required Uint8List privateKeyBytes, String? seedPhrase, required WalletType walletType}) async {
    final prefs = await SharedPreferences.getInstance();
    final privateKeyHex = _bytesToHex(privateKeyBytes);

    await prefs.setString(_keyPublicKey, publicKey);
    await prefs.setString(_keyPrivateKey, privateKeyHex);
    await prefs.setString(_keyDisplayName, 'Wallet \${publicKey.substring(0, 8)}');
    await prefs.setString(_keyWalletType, walletType.toString());

    if (seedPhrase != null) {
      await prefs.setString(_keySeedPhrase, seedPhrase);
    }
  }

  String _bytesToHex(Uint8List bytes) => bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  Uint8List _hexToBytes(String hex) {
    final result = Uint8List(hex.length ~/ 2);
    for (int i = 0; i < result.length; i++) {
      result[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return result;
  }

  WalletType _parseWalletType(String? typeStr) {
    if (typeStr == null) return WalletType.none;
    return WalletType.values.firstWhere((e) => e.toString() == typeStr, orElse: () => WalletType.none);
  }
}

final walletServiceProvider = StateNotifierProvider<WalletService, WalletState>((ref) {
  final solanaClient = SolanaClient(rpcUrl: Uri.parse(AppConfig.solanaRpcUrl), websocketUrl: Uri.parse('wss://api.devnet.solana.com'));
  return WalletService(solanaClient);
});

final currentKeyPairProvider = Provider<Ed25519HDKeyPair?>((ref) {
  final walletService = ref.watch(walletServiceProvider.notifier);
  return walletService.keypair;
});

final currentPublicKeyProvider = Provider<Ed25519HDPublicKey?>((ref) {
  final walletService = ref.watch(walletServiceProvider.notifier);
  return walletService.publicKeyObj;
});
