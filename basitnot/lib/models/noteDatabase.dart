import 'package:basitnot/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase{
  static late Isar isar;
  //Initialize the database
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }
  //Create a new note
  final List<Note> notes = [];
  
  Future<void> create(Note note) async {
    await isar.writeTxn((isar) async {
      await isar.notes.put(note);
    } as Future<dynamic> Function());

    fetchNotes();

  }

  Future<void> fetchNotes() async {
    final allNotes = await isar.notes.where().findAll();
    notes.clear();
    notes.addAll(allNotes);
  }

  //Update a note

  Future<void> update(Note note) async {
   final existingNote = await isar.notes.get(note.id);
   if(existingNote != null){
     
     existingNote.title = note.title;
     existingNote.content = note.content;
     existingNote.lastEditDate = DateTime.now();

     await isar.writeTxn((isar) async {
       await isar.notes.put(existingNote);
     } as Future<dynamic> Function());
     await fetchNotes();
   }
  }
  //Delete a note
  Future<void> delete(Note note) async {
    await isar.writeTxn((isar) async {
      await isar.notes.delete(note.id);
    } as Future<dynamic> Function());
    await fetchNotes();
  }

  //Retrieve all notes

  //Retrieve a single note

  //Delete all notes

}