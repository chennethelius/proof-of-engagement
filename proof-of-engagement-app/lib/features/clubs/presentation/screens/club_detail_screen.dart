import 'package:flutter/material.dart';

class ClubDetailScreen extends StatelessWidget {
  final String clubId;
  const ClubDetailScreen({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Club Details')),
      body: Center(child: Text('Club: $clubId')),
    );
  }
}
