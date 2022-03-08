import 'dart:convert';

class Notes {
  int id;
  String title;
  String body;
  DateTime creationDate;
  Notes({
    required this.id,
    required this.title,
    required this.body,
    required this.creationDate,
  });

  Notes copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? creationDate,
  }) {
    return Notes(
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

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      creationDate: DateTime.parse(map['creationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) => Notes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notes(id: $id, title: $title, body: $body, creationDate: $creationDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Notes &&
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
