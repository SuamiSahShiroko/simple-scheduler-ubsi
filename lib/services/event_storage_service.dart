// service/event_storage_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../event.dart';

class EventStorageService {
  final String key = 'events';

  Future<List<Event>> getEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      final List<dynamic> data = json.decode(jsonString);
      final List<Event> events =
          data.map((eventData) => Event.fromJson(eventData)).toList();
      return events;
    } else {
      return [];
    }
  }

  Future<void> addEvent(Event event) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Event> events = await getEvents();
    events.add(event);
    prefs.setString(key, json.encode(events));
  }

  Future<void> editEvent(Event oldEvent, Event newEvent) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Event> events = await getEvents();
    final int index =
        events.indexWhere((event) => event.title == oldEvent.title);
    if (index != -1) {
      events[index] = newEvent;
      prefs.setString(key, json.encode(events));
    }
  }

  Future<void> deleteEvent(Event event) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Event> events = await getEvents();
    events.removeWhere((e) => e.title == event.title);
    prefs.setString(key, json.encode(events));
  }
}
