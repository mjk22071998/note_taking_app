import 'dart:convert';

class Note {
  int id;
  String title;
  String body;
  DateTime creationDate;
  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.creationDate,
  });

  Note copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? creationDate,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'creationDate': creationDate.toString(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      creationDate: DateTime.parse(map['creationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notes(id: $id, title: $title, body: $body, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Note &&
      other.id == id &&
      other.title == title &&
      other.body == body &&
      other.creationDate == creationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      body.hashCode ^
      creationDate.hashCode;
  }
}
