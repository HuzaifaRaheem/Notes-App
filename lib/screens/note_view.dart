import 'package:flutter/material.dart';

import '../model/note_model.dart';
class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.noteModel, required this.index, required this.onDeletedNote});

  final NoteModel noteModel;
  final int index;
  final Function(int) onDeletedNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Delete this?"),
                    content: Text("Note ${noteModel.title} will be  deleted!"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                        onDeletedNote(index);
                      }, child: Text('Delete')),
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Cancel')),
                    ],
                  );
                });
          },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteModel.title,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              noteModel.body,
              style: TextStyle(fontSize: 16),
            ),

          ],
        ),
      ),
    );
  }
}
