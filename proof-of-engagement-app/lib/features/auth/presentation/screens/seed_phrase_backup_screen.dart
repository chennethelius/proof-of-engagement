import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SeedPhraseBackupScreen extends StatefulWidget {
  final String seedPhrase;
  final String destination; // 'student-home' or 'club-home'

  const SeedPhraseBackupScreen({
    super.key,
    required this.seedPhrase,
    required this.destination,
  });

  @override
  State<SeedPhraseBackupScreen> createState() => _SeedPhraseBackupScreenState();
}

class _SeedPhraseBackupScreenState extends State<SeedPhraseBackupScreen> {
  bool _hasConfirmed = false;
  bool _obscureSeedPhrase = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.seedPhrase.split(' ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup Seed Phrase'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Warning Icon
              Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: Colors.orange.shade700,
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                'Backup Your Seed Phrase',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Warning Message
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.orange.shade700, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Important',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• Write down these 12 words in order\n'
                      '• Store them in a safe place\n'
                      '• Never share them with anyone\n'
                      '• This is the ONLY way to recover your wallet',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange.shade900,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Seed Phrase Display
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(words.length, (index) {
                            return Container(
                              width: (MediaQuery.of(context).size.width - 80) / 3,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${index + 1}.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      _obscureSeedPhrase ? '••••••' : words[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'monospace',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      if (_obscureSeedPhrase)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tap to reveal',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: widget.seedPhrase));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Seed phrase copied to clipboard'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 20),
                      label: const Text('Copy'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _obscureSeedPhrase = !_obscureSeedPhrase;
                        });
                      },
                      icon: Icon(
                        _obscureSeedPhrase ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                      ),
                      label: Text(_obscureSeedPhrase ? 'Show' : 'Hide'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Confirmation Checkbox
              CheckboxListTile(
                value: _hasConfirmed,
                onChanged: (value) {
                  setState(() {
                    _hasConfirmed = value ?? false;
                  });
                },
                title: const Text(
                  'I have written down my seed phrase and stored it safely',
                  style: TextStyle(fontSize: 14),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
              const SizedBox(height: 16),

              // Continue Button
              ElevatedButton(
                onPressed: _hasConfirmed
                    ? () {
                        context.goNamed(widget.destination);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),

              // Skip Warning (optional - can be removed for better security)
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                        'Without your seed phrase, you will permanently lose access to your wallet if you uninstall the app or lose your device.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Go Back'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.goNamed(widget.destination);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('Skip Anyway'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Skip (Not Recommended)',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
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
