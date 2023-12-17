// event_list.dart
import 'package:flutter/material.dart';
import 'event.dart'; // Import the Event class
import 'event_item.dart'; // Import the EventItem class

class EventList extends StatelessWidget {
  final List<Event> events;
  final void Function(Event) onEdit;
  final void Function(Event) onDelete;

  const EventList({
    required this.events,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return InkWell(
            onTap: () => onEdit(event),
            child: EventItem(
              event: event,
              onEdit: () => onEdit(event),
              onDelete: () => onDelete(event),
            ),
          );
        },
      ),
    );
  }
}
