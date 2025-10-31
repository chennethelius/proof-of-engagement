#!/bin/bash

# Manual Test Script for Solana Transactions
# This script helps you test the blockchain integration manually

set -e

echo "🧪 Proof of Engagement - Blockchain Integration Test"
echo "======================================================"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if solana CLI is installed
if ! command -v solana &> /dev/null; then
    echo -e "${RED}❌ Solana CLI not found!${NC}"
    echo "Install: sh -c \"\$(curl -sSfL https://release.solana.com/stable/install)\""
    exit 1
fi

echo -e "${GREEN}✅ Solana CLI found${NC}"
echo ""

# Configuration
CLUSTER="devnet"
PROGRAM_ID="5cCUfaLSDyNMV21cYsMgBrvVfm8JVNTVzVWcFY2V7R8t"

echo "📋 Configuration:"
echo "   Cluster: $CLUSTER"
echo "   Program ID: $PROGRAM_ID"
echo ""

# Check program exists
echo "🔍 Checking if program is deployed..."
if solana program show $PROGRAM_ID --url $CLUSTER &> /dev/null; then
    echo -e "${GREEN}✅ Program found on $CLUSTER!${NC}"
    solana program show $PROGRAM_ID --url $CLUSTER | head -5
else
    echo -e "${RED}❌ Program not found on $CLUSTER${NC}"
    exit 1
fi
echo ""

# Generate test wallet
echo "🔑 Generating test wallet..."
TEST_WALLET="./test-wallet.json"

if [ -f "$TEST_WALLET" ]; then
    echo -e "${YELLOW}⚠️  Test wallet already exists, using existing wallet${NC}"
else
    solana-keygen new --no-bip39-passphrase -o $TEST_WALLET --force
fi

WALLET_ADDRESS=$(solana-keygen pubkey $TEST_WALLET)
echo -e "${GREEN}✅ Wallet address: $WALLET_ADDRESS${NC}"
echo ""

# Check balance
echo "💰 Checking wallet balance..."
BALANCE=$(solana balance $WALLET_ADDRESS --url $CLUSTER 2>/dev/null || echo "0")
echo "   Balance: $BALANCE"

if [[ "$BALANCE" == "0"* ]]; then
    echo -e "${YELLOW}⚠️  Wallet has no SOL, requesting airdrop...${NC}"
    
    # Request airdrop
    if solana airdrop 1 $WALLET_ADDRESS --url $CLUSTER; then
        echo -e "${GREEN}✅ Airdrop successful!${NC}"
        sleep 5 # Wait for confirmation
        BALANCE=$(solana balance $WALLET_ADDRESS --url $CLUSTER)
        echo "   New balance: $BALANCE"
    else
        echo -e "${RED}❌ Airdrop failed (rate limit or network issue)${NC}"
        echo "   Try again in a minute or use: solana airdrop 1 $WALLET_ADDRESS --url devnet"
        exit 1
    fi
fi
echo ""

# Now run the Flutter test
echo "🚀 Running Flutter integration test..."
echo ""

# Make sure we're in the Flutter project directory (where the script is located)
cd "$(dirname "$0")"

if flutter test test/solana_integration_test.dart; then
    echo ""
    echo -e "${GREEN}🎉 ALL TESTS PASSED!${NC}"
    echo ""
    echo "✅ Your blockchain integration is working!"
    echo "   Program ID: $PROGRAM_ID"
    echo "   Network: $CLUSTER"
    echo "   Test wallet: $WALLET_ADDRESS"
    echo ""
    echo "🔍 View transactions on explorer:"
    echo "   https://explorer.solana.com/address/$WALLET_ADDRESS?cluster=devnet"
else
    echo ""
    echo -e "${RED}❌ TESTS FAILED${NC}"
    echo "Check the error messages above"
    exit 1
fi
