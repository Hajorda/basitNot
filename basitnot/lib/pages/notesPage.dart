// ignore_for_file: camel_case_types

import 'package:basitnot/components/drawer.dart';
import 'package:basitnot/main.dart';
import 'package:basitnot/models/note.dart';
import 'package:basitnot/models/noteDatabase.dart';
import 'package:basitnot/pages/editPage.dart';
import 'package:basitnot/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class notesPage extends StatefulWidget {
  const notesPage({super.key});

  @override
  State<notesPage> createState() => _notesPageState();

  
}

class _notesPageState extends State<notesPage> {
 bool result = false;
 
  final currentUser = FirebaseAuth.instance.currentUser;
@override
  void initState() {
    super.initState();
    readNotes();
    
    isDeviceConnected.addListener(() {
      setState(() {
        result = isDeviceConnected.value;
      });
    });
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
          decoration: const InputDecoration(hintText: 'Not Basligi'),
          controller: textController,
        ),
        actions: <Widget>[
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text('Vazgeç')),
          TextButton(onPressed: () {
            Note tempNote = Note(
              title: textController.text,
              creationDate: DateTime.now(),
              lastEditDate: DateTime.now(),
              content: '',
            );
            context.read<NoteDatabase>().create(tempNote);
            if(isDeviceConnected.value){
              if(currentUser != null)
              FireStoreService().addNote(tempNote);
              else{

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('You must be logged in to use this feature!'),));
              }

            }
          
            
            // NoteDatabase.instance.create({'title': noteTitle, 'content': noteContent});
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(tempNote)),);
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

    return Scaffold(appBar: AppBar( elevation: 0, backgroundColor: Colors.transparent,), 
    backgroundColor: Theme.of(context).colorScheme.background,
    drawer: const DrawerWidget(),
    body: Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text
        Padding(padding: const EdgeInsets.only(left: 25.0),child: Text("Notes ", style: GoogleFonts.dmSerifText(fontSize: 48, color: Theme.of(context).colorScheme.inversePrimary),) ,),

        // List of notes
        Expanded(
          child: ListView.builder(itemCount: notes.length, itemBuilder: (context, index) {
            return ListTile(
              title: Text(notes[index].title),
              //subtitle: Text(notes[index].content),
              trailing: 
                  IconButton(icon: const Icon(Icons.delete), onPressed: () {
                    context.read<NoteDatabase>().delete(notes[index]);
                    if(isDeviceConnected.value){
                      FireStoreService().deleteNote(notes[index]);
                    }
                    else{
                      //TODO: HANDLE THE SEND LATER DATABASE DELETED
                    }
                  },),
                  onTap: () => { 
                    print('Tapped on ${notes[index].title}'),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(notes[index])),
                    ),
                    
                  },
              );
          },),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      print(checkInternetConnection());
      print(isDeviceConnected.value);
      print("object");
      print(result);
      createNote();
    }, child:  Icon(Icons.add,color: Theme.of(context).colorScheme.inversePrimary),),);
  }
}