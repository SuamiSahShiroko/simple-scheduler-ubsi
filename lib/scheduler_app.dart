import 'dart:async';
import 'package:flutter/material.dart';
import 'event.dart';
import 'add_event_form.dart';
import 'event_details_screen.dart';
import 'edit_event_screen.dart';
import 'event_list.dart';
import 'widget/alarm_logo.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SchedulerApp extends StatefulWidget {
  @override
  _SchedulerAppState createState() => _SchedulerAppState();
}

class _SchedulerAppState extends State<SchedulerApp> {
  final List<Event> _events = [];
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _scheduleCheckEvents();
  }

  void _scheduleCheckEvents() {
    Timer.periodic(Duration(seconds: 30), (timer) {
      _checkEvents();
    });
  }

  void _checkEvents() {
  DateTime now = DateTime.now();
  for (Event event in _events) {
    if (now.isAfter(event.startTime) && now.isBefore(event.endTime)) {
      _playAudio(); // Play audio when the event's date has arrived
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            children: [
              AlarmLogo(),
              SizedBox(height: 8.0),
              Text('PERINGATAN!'),
            ],
          ),
          content: Text('acara ${event.title} sedang berjalan.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  _stopAudio(); // Stop audio when the user presses "OK"
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ),
          ],
        ),
      );
    }
  }
}


  void _playAudio() {
    _assetsAudioPlayer.open(
      Audio('assets/123456.mp3'),
      autoStart: true,
      showNotification: true,
    );
  }

  void _stopAudio() {
    _assetsAudioPlayer.stop();
  }

  void addEvent(Event event) {
    setState(() {
      _events.add(event);
    });
  }

  void editEvent(Event oldEvent, Event newEvent) {
    setState(() {
      int index = _events.indexOf(oldEvent);
      if (index != -1) {
        _events[index] = newEvent;
      }
    });
  }

  void deleteEvent(Event event) {
    setState(() {
      _events.remove(event);
    });
  }

  void viewEventDetails(Event event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailsScreen(
          event: event,
          onEdit: (event) => _editEvent(event),
          onDelete: (event) => deleteEvent(event),
        ),
      ),
    );
  }

  void _editEvent(Event event) async {
    final editedEvent = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEventScreen(
          event: event,
        ),
      ),
    );

    if (editedEvent != null) {
      editEvent(event, editedEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Penjadwalan Sederhana'),
      ),
      body: Column(
        children: [
          EventList(
            events: _events,
            onEdit: (event) => _editEvent(event),
            onDelete: (event) => deleteEvent(event),
          ),
          ElevatedButton(
            onPressed: () => _showAddEventDialog(context),
            child: Text('Tambahkan Acara'),
          ),
        ],
      ),
    );
  }

  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            AlarmLogo(),
            SizedBox(height: 8.0),
            Text('Tambahkan Acara'),
          ],
        ),
        content: Center(
          child: AddEventForm(onSubmit: (event) => addEvent(event)),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
          ),
        ],
      ),
    );
  }
}
