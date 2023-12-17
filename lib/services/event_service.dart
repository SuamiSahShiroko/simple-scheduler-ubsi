// lib/services/event_service.dart
import 'package:dio/dio.dart';
import '../event.dart';

class EventService {
  static const String _baseUrl =
      'https://6577fa9e197926adf62f3010.mockapi.io/events'; // Updated mock API endpoint
  final Dio _dio = Dio();

  Future<List<Event>> getEvents() async {
    try {
      final response = await _dio.get('$_baseUrl/events');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Event.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load events');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> saveEvents(List<Event> events) async {
    try {
      final eventsJson = events.map((event) => event.toJson()).toList();

      await _dio.post(
        '$_baseUrl/events',
        data: {'events': eventsJson},
        options: Options(contentType: Headers.jsonContentType),
      );
    } catch (e) {
      throw Exception('Failed to save events. Error: $e');
    }
  }
}
