import 'package:basitnot/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  
  //Add Note
  Future<void> addNote(Note note) async {
    print(currentUser);
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    await notes.add({
      'userId': this.currentUser,
      'id': note.id.toString(),
      'title': note.title,
      'content': note.content,
      'creationDate': note.creationDate,
      'lastEditDate': note.lastEditDate,
    });
  }

  //Get Notes
  Stream<QuerySnapshot> getNotes() {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    return notes.snapshots();
  }
  

  //Update Note
  Future<void> updateNote(Note originalNote, Note eNote) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    await notes
        .where('id', isEqualTo: originalNote.id)
        .where('userId', isEqualTo: '12345')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        notes.doc(element.id).update({
          'title': eNote.title,
          'content': eNote.content,
          'lastEditDate': eNote.lastEditDate,
        });
      });
    });
  }

  //Delete Note
  Future<void> deleteNote(Note note) async {
    CollectionReference notes = FirebaseFirestore.instance.collection('notes');
    await notes
        .where('id', isEqualTo: note.id)
        .where('userId', isEqualTo: '12345')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        notes.doc(element.id).delete();
      });
    });
  }
  


}
