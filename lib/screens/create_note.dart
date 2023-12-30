import 'package:flutter/material.dart';
import 'package:notes_app/model/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key,required this.onNewNoteCreated});
  final Function(NoteModel) onNewNoteCreated;
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController=TextEditingController();
  final bodyController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 22),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Title',

            ),),
            const SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: bodyController,
              style: TextStyle(fontSize: 17),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Body',

              ),),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(titleController.text.isEmpty){
            return;
          }
          if(bodyController.text.isEmpty){
            return;
          }
          final note=NoteModel(title: titleController.text, body: bodyController.text);
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
      ),

    );
  }
}
