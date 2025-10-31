import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../../../shared/services/qr_code_service.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  final String? clubId;
  
  const CreateEventScreen({
    super.key,
    this.clubId,
  });

  @override
  ConsumerState<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _capacityController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _requiresPhoto = true;
  bool _isLoading = false;
  String? _generatedQRData;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _generateEventId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final clubId = widget.clubId ?? 'club';
    final data = '$clubId-$timestamp-${_nameController.text}';
    final bytes = utf8.encode(data);
    final hash = sha256.convert(bytes);
    return hash.toString().substring(0, 16);
  }

  void _createEvent() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Generate event ID
      final eventId = _generateEventId();
      
      // TODO: Derive event PDA from blockchain
      final eventPda = 'mock_pda_$eventId'; // This should come from PdaService
      
      // Generate QR code using QRCodeService
      final qrData = QRCodeService.generateEventQR(
        eventId: eventId,
        eventPda: eventPda,
        clubName: widget.clubId ?? 'Unknown Club',
        eventName: _nameController.text,
        expiryMinutes: 5,
      );

      setState(() {
        _generatedQRData = qrData.toJson();
        _isLoading = false;
      });

      // Show QR code dialog
      _showQRCodeDialog(eventId, qrData);
    }
  }

  void _showQRCodeDialog(String eventId, EventQRData qrData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Event Created! 🎉'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Your event has been created successfully!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // QR Expiry Warning
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, color: Colors.orange.shade700, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'QR expires in 5 minutes',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: QrImageView(
                  data: _generatedQRData!,
                  version: QrVersions.auto,
                  size: 200.0,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                qrData.eventName,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Event ID: ${eventId.substring(0, 8)}...',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 16),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Students scan this to check in',
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Go back to previous screen
            },
            child: const Text('Done'),
          ),
          FilledButton.icon(
            onPressed: () {
              // TODO: Save QR code or share
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('QR code saved!')),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Save QR'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Event Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
                hintText: 'e.g., Weekly Meetup',
                prefixIcon: Icon(Icons.event),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an event name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'What is this event about?',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Date and Time
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.calendar_today, size: 20),
                                SizedBox(width: 8),
                                Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () => _selectTime(context),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.access_time, size: 20),
                                SizedBox(width: 8),
                                Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _selectedTime.format(context),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Location
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'Where will this take place?',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Capacity
            TextFormField(
              controller: _capacityController,
              decoration: const InputDecoration(
                labelText: 'Capacity',
                hintText: 'Maximum attendees',
                prefixIcon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter capacity';
                }
                final capacity = int.tryParse(value);
                if (capacity == null || capacity <= 0) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Photo Requirement Toggle
            Card(
              child: SwitchListTile(
                title: const Text('Require Photo Proof'),
                subtitle: const Text('Attendees must upload a photo at check-in'),
                value: _requiresPhoto,
                onChanged: (value) {
                  setState(() {
                    _requiresPhoto = value;
                  });
                },
                secondary: const Icon(Icons.photo_camera),
              ),
            ),
            const SizedBox(height: 32),

            // Create Button
            FilledButton.icon(
              onPressed: _isLoading ? null : _createEvent,
              icon: _isLoading 
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.add),
              label: Text(_isLoading ? 'Creating...' : 'Create Event'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}