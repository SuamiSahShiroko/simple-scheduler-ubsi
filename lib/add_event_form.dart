// add_event_form.dart
import 'package:flutter/material.dart';
import 'event.dart'; // Import the Event class

class AddEventForm extends StatefulWidget {
  final void Function(Event) onSubmit;
  final void Function(Event, Event)? onEdit; // Make onEdit optional
  final Event? editEvent;

  AddEventForm({
    required this.onSubmit,
    this.onEdit, // Make onEdit optional
    this.editEvent,
  });

  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(Duration(seconds: 30));

  @override
  void initState() {
    super.initState();
    // If the widget is used for editing, set initial values
    if (widget.editEvent != null) {
      _titleController.text = widget.editEvent!.title;
      _descriptionController.text = widget.editEvent!.description;
      _startTime = widget.editEvent!.startTime;
      _endTime = widget.editEvent!.endTime;
    }
  }

  void _handleAddEvent() {
    final event = Event(
      title: _titleController.text,
      description: _descriptionController.text,
      startTime: _startTime,
      endTime: _endTime,
    );

    if (widget.onEdit != null && widget.editEvent != null) {
      widget.onEdit!(widget.editEvent!, event);
      _showSnackbar('Event edited successfully!');
    } else {
      widget.onSubmit(event);
      _showSnackbar('Event added successfully!');
    }

    Navigator.pop(context);
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Nama Acara',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Deskripsi Acara',
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Waktu Acara :'),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_startTime),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _startTime = DateTime(
                        _startTime.year,
                        _startTime.month,
                        _startTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                },
                child: Text('Pilih Waktu'),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _handleAddEvent,
          child: Text(
              widget.editEvent != null ? 'Sunting Acara' : 'Tambahkan Acara'),
        ),
      ],
    );
  }
}
