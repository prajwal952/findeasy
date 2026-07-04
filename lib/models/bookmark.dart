import 'dart:convert';

class Bookmark {
  final String id;
  final String content; // URL or text
  final String type; // e.g. text, image, pdf
  final DateTime timestamp;

  Bookmark({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'type': type,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory Bookmark.fromMap(Map<String, dynamic> map) {
    return Bookmark(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      type: map['type'] ?? 'text',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] ?? 0),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bookmark.fromJson(String source) => Bookmark.fromMap(json.decode(source));
}
