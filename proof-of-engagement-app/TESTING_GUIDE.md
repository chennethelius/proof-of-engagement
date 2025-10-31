# 🧪 Testing Real Blockchain Transactions

## Three Ways to Test

### Option 1: Automated Test Script (Easiest) ⭐

```bash
cd /Users/maxchen/Documents/GitHub/proof-of-engagement/proof-of-engagement-app
./test_blockchain.sh
```

This will:
- ✅ Check if Solana CLI is installed
- ✅ Verify program is deployed on devnet
- ✅ Generate test wallet
- ✅ Request devnet SOL airdrop
- ✅ Run Flutter integration tests
- ✅ Show transaction on explorer

---

### Option 2: Manual Flutter Test

```bash
cd /Users/maxchen/Documents/GitHub/proof-of-engagement/proof-of-engagement-app

# Run the integration test
flutter test test/solana_integration_test.dart
```

**Note:** You'll need a wallet with devnet SOL. See instructions below.

---

### Option 3: Test in the Running App

1. **Run the app:**
   ```bash
   flutter run
   ```

2. **Create a wallet** (the app generates one automatically)

3. **Get the wallet address** from the app or logs

4. **Fund it with devnet SOL:**
   ```bash
   # Replace with your wallet address from the app
   solana airdrop 2 YOUR_WALLET_ADDRESS --url devnet
   ```

5. **Try to register a club** in the app
   - Watch the debug logs for transaction details
   - Look for "✅ Transaction sent: XXXXX"
   - Copy the signature and check explorer

---

## 🔍 Verifying Transactions

### Check on Solana Explorer:
```
https://explorer.solana.com/tx/YOUR_SIGNATURE?cluster=devnet
```

### Or use Solana CLI:
```bash
solana confirm YOUR_SIGNATURE --url devnet
```

---

## 📋 What to Look For

### ✅ SUCCESS Indicators:
```
🔗 Club PDA: 8xQ2Yp... (real PDA address)
📦 Instruction data: 45 bytes
🔢 Recent blockhash: ABC123... (real blockhash)
📤 Sending transaction...
✅ Transaction sent: 3Kx9Ym2... (real signature, NOT starting with "mock_")
```

### ⚠️ FALLBACK (Expected if no SOL):
```
❌ Transaction failed: InsufficientFundsForRent
⚠️ Using mock signature for demo
mock_register_club_1730...
```

---

## 🐛 Troubleshooting

### Issue: "Airdrop failed"
**Solution:** Devnet has rate limits. Wait 1 minute and try again.

### Issue: "InsufficientFundsForRent"
**Solution:** Need more SOL for the account rent.
```bash
solana airdrop 2 YOUR_ADDRESS --url devnet
```

### Issue: "Signature verification failed"
**Solution:** This is a signing issue. Check:
1. Wallet keypair is valid
2. Message is compiled correctly
3. Using correct signing method

### Issue: "Blockhash not found"
**Solution:** Network issue. The recent blockhash might be too old. Retry.

---

## 📊 Expected Results

### First Run (No SOL):
```
🧪 Testing registerClub() with REAL blockchain transaction...
❌ Transaction failed: insufficient lamports...
⚠️ Fell back to mock (expected if no devnet SOL)

To test with real devnet:
1. Get devnet SOL: solana airdrop 1 ABC123... --url devnet
2. Rerun this test
```

### After Getting SOL:
```
🧪 Testing registerClub() with REAL blockchain transaction...
🔗 Club PDA: 8xQ2YpXxxxx
📦 Instruction data: 45 bytes
🔢 Recent blockhash: 9Kx8YmZzzz
📤 Sending transaction...
✅ Transaction sent: 5Jx7WnXxxxxxxxxxxxxxxxxxxxxxx
🎉 SUCCESS! Real transaction sent to blockchain!
   View on explorer: https://explorer.solana.com/tx/5Jx7...?cluster=devnet
```

---

## 🎯 Quick Start (Recommended)

```bash
# 1. Make sure you have Solana CLI
solana --version

# 2. Run the automated test script
cd proof-of-engagement-app
./test_blockchain.sh

# 3. Watch for SUCCESS message and explorer link!
```

---

## 💡 Tips

1. **Save the test wallet:** The script saves `test-wallet.json`. Keep it to reuse the same wallet with SOL.

2. **Check explorer immediately:** Devnet transactions can be viewed right away at https://explorer.solana.com

3. **Rate limits:** Devnet airdrops are rate-limited to 1 SOL per minute per wallet.

4. **Program verification:** You can verify the program is deployed:
   ```bash
   solana program show DGMwn7z9fqvaDVXy7tuiXcjvUT8T94Hz5VuTyYo2RPGn --url devnet
   ```

---

## 🚀 Ready to Test!

Pick your method above and verify that real blockchain transactions work! 🎉
