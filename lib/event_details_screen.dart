// event_details_screen.dart
import 'package:flutter/material.dart';
import 'event.dart'; // Import the Event class

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  final void Function(Event) onEdit;
  final void Function(Event) onDelete;

  const EventDetailsScreen({
    required this.event,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi Acara'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${event.title}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Deskripsi Acara: ${event.description}'),
            SizedBox(height: 10.0),
            Text('Waktu Acara Mulai: ${event.startTime}'),
            SizedBox(height: 10.0),
            Text('Waktu Acara Selesai: ${event.endTime}'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onEdit(event),
                  child: Text('Sunting Acara'),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () => onDelete(event),
                  child: Text('Hapus Acara'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
