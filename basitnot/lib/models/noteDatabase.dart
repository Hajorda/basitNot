import 'package:basitnot/models/note.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;
  //Initialize the database
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [NoteSchema], 
      directory: dir.path);
  }
  //Create a new note
  final List<Note> notes = [];
  
  Future<void> create(Note note) async {
    await isar.writeTxn( () => isar.notes.put(note));
 
    fetchNotes();

  }

  Future<void> fetchNotes() async {
    final allNotes = await isar.notes.where().findAll();
    notes.clear();
    notes.addAll(allNotes);
    notifyListeners();
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

  //Retrieve all notes
  Future<List<Note>> retrieveAllNotes() async {
    return await isar.notes.where().findAll();
  }

  //Retrieve a single note
  Future<Note?> retrieveSingleNote(int id) async {
    return await isar.notes.get(id);
  }

  //Delete all notes
  
  
  //Delete a note
  Future<void> delete(Note note) async {
    await isar.writeTxn(() => isar.notes.delete(note.id));
    await fetchNotes();
  }


    //Edit content of a note
  Future<void> editContent(Note note, Note newContent) async {
    final existingNote = await isar.notes.get(note.id);
    if(existingNote != null){
      existingNote.content = newContent.content;
      existingNote.title = newContent.title;
      existingNote.lastEditDate = DateTime.now();
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }
}