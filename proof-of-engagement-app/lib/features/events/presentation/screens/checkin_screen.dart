import 'package:flutter/material.dart';

class CheckinScreen extends StatelessWidget {
  final String eventId;
  const CheckinScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In')),
      body: Center(child: Text('QR Check-in for Event: $eventId')),
    );
  }
}
