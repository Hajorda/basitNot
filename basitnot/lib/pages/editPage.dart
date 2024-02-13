import 'package:basitnot/models/note.dart';
import 'package:basitnot/models/noteDatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  final Note noteInEditing;
  const EditPage(this.noteInEditing, {super.key});
  

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {


  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _titleFocus = FocusNode();
  final _contentFocus = FocusNode();


  String _initialTitle = 'Baslik';
  String _initialContent = '';

  var currentNote;

  @override
  void initState() {
    currentNote = widget.noteInEditing;
    _initialTitle = currentNote.title;
    _initialContent = currentNote.content;
    _titleController.text = _initialTitle;
    _contentController.text = _initialContent;

    //FocusScope.of(context).requestFocus(_titleFocus);

    super.initState();
  }
  
  void updateNoteObject() {
    currentNote.title = _titleController.text;
    currentNote.content = _contentController.text;

    currentNote.lastEditDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Not Düzenle'),
          leading: BackButton(
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {
                context.read<NoteDatabase>().editContent(widget.noteInEditing, currentNote);
                updateNoteObject();     
                Navigator.pop(context);         
              },
            ),
      
            elevation: 1
        ),
        
        body:  Container(padding: const EdgeInsets.only(left: 16, right: 16, top: 12), 
        child: SafeArea(left: true,right: true,top: false,bottom: false, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
       
       Flexible(child: 
        Container(
          child: EditableText(
            onChanged: (str) => {updateNoteObject()},
                  maxLines: null,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary ,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  cursorColor: Colors.blue,
                  backgroundCursorColor: Colors.blue,
                  controller: _titleController,
                  focusNode: _titleFocus,
                  ),
              
        )),
      
         Divider(color: Theme.of(context).colorScheme.inversePrimary),
      
        Flexible(child: Container(
          child: EditableText(
            onChanged: (str) => {updateNoteObject()},
                  maxLines: 300,
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 17),
                  cursorColor: Colors.blue,
                  backgroundCursorColor: Colors.blue,
                  controller: _contentController,
                  focusNode: _contentFocus,
                  
                  ),
              
        )),
      
        ],)),),
        ),
    );
  }
}