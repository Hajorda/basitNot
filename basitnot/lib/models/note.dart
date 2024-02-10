import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {

  Id id = Isar.autoIncrement;
  late String title;
  late String content;
  late DateTime creationDate;
  late DateTime lastEditDate;

  Note({
    required this.title,
    required this.creationDate,
    required this.lastEditDate,
    this.content = '',
  });

}