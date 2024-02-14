import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {

  Id id = Isar.autoIncrement;
  late String title;
  late String content;
  late DateTime creationDate;
  late DateTime lastEditDate;
  late bool isSynced;

  Note({
    required this.title,
    required this.creationDate,
    required this.lastEditDate,
    this.content = '',
    this.isSynced = false,
  });

  factory Note.fromJson(json) {
    return Note(
      title: json['title'],
      content: json['content'],
      creationDate: DateTime.parse(json['creationDate']),
      lastEditDate: DateTime.parse(json['lastEditDate']),
      isSynced: json['isSynced'],
    );
}

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'creationDate': creationDate.toIso8601String(),
      'lastEditDate': lastEditDate.toIso8601String(),
      'isSynced': isSynced,
    };
  }

}
