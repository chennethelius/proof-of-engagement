import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  final String? clubId;
  const CreateEventScreen({super.key, this.clubId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: const Center(child: Text('Create Event Form - Coming Soon')),
    );
  }
}
