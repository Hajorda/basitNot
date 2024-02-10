import 'package:basitnot/models/note.dart';
import 'package:basitnot/models/noteDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class notesPage extends StatefulWidget {
  const notesPage({super.key});

  @override
  State<notesPage> createState() => _notesPageState();

  
}

class _notesPageState extends State<notesPage> {

@override
  void initState() {
    super.initState();
    readNotes();
  }
final textController = TextEditingController();
  
  void createNote() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Not Ekle'),
        content: TextField( 
          onChanged: (value) {
            // noteTitle = value;
          },
          decoration: const InputDecoration(hintText: 'Not Başlığı'),
          controller: textController,
        ),
        actions: <Widget>[
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Vazgeç')),
          TextButton(onPressed: () {
            context.read<NoteDatabase>().create(Note(title: textController.text, creationDate: DateTime.now(), lastEditDate: DateTime.now()));
            // NoteDatabase.instance.create({'title': noteTitle, 'content': noteContent});
            Navigator.pop(context);
            textController.clear();
          }, child: const Text('Ekle')),
        ],
      );
    });
  }

  // Read all notes
    void readNotes() {
      context.read<NoteDatabase>().fetchNotes();
    }

  // Update a note

  // Delete a note


  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> notes = noteDatabase.notes;

    return Scaffold(appBar: AppBar(title: Text('Basit Notlar')), 
    body: ListView.builder(itemCount: notes.length, itemBuilder: (context, index) {
      return ListTile(
        title: Text(notes[index].title),
        //subtitle: Text(notes[index].content),
        trailing: 
            IconButton(icon: const Icon(Icons.delete), onPressed: () {
              context.read<NoteDatabase>().delete(notes[index]);
            },),
            onTap: () => print('Tapped on ${notes[index].title}'),
        );
    },),
    floatingActionButton: FloatingActionButton(onPressed: () {
      createNote();
    }, child: const Icon(Icons.add),),);
  }
}