import 'package:flutter/material.dart';
import 'package:notes_app/screens/create_note.dart';
import 'package:notes_app/screens/widgets/note_card.dart';

import '../model/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> notes= List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text('My Notes'),
        ),
        body: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context,index){
              return NoteCard(noteModel: notes[index], index: index,onDeletedNote: onDeletedNote,);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNote(onNewNoteCreated: onNewNoteCreated,)));
          },
          child: const Icon(Icons.add),
        ),
    );
  }
  void onNewNoteCreated(NoteModel noteModel){
    notes.add(noteModel);
    setState(() {

    });
  }
  void onDeletedNote(int index){
    notes.removeAt(index);
    setState(() {

    });
  }
}
