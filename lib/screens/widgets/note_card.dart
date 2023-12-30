import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteModel, required this.index, required this.onDeletedNote});

  final NoteModel noteModel;
  final int index;
  final Function(int) onDeletedNote;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(noteModel: noteModel, index: index,onDeletedNote: onDeletedNote,)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteModel.title,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              Text(
                noteModel.body,
                style: TextStyle(
                    fontSize: 15
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),
      ),
    );;
  }
}
