// event.dart
class Event {
  String title;
  String description;
  DateTime startTime;
  DateTime endTime;

  Event({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  // Add this factory method to create an Event object from a Map
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  // Add this method to convert an Event object to a Map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}
