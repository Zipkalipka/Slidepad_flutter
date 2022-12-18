import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notepad_minus_minus/data/app_db.dart';
import 'package:notepad_minus_minus/utilities/constants.dart';
import 'package:notepad_minus_minus/utilities/drift_provider.dart';
import 'package:provider/provider.dart';
import 'noteTile.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Note> listOfNotes = Provider.of<List<Note>>(context);
    DriftProvider driftProvider = Provider.of<DriftProvider>(context);
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: SlidableAutoCloseBehavior(
        closeWhenTapped: false,
        child: ReorderableListView.builder(
          itemCount: listOfNotes.length,
          padding: listLRPadding,
          onReorderStart: (context) {},
          onReorder: (int oldIndex, int newIndex) {
            final corrIndex = newIndex > oldIndex ? (newIndex - 1) : newIndex;
            final reorderNote = listOfNotes.removeAt(oldIndex);
            listOfNotes.insert(corrIndex, reorderNote);
            driftProvider.reorderNotes(oldIndex, corrIndex);
          },
          itemBuilder: (context, index) {
            final note =
                listOfNotes.firstWhere((element) => element.order == index);
            return NoteTile(key: ValueKey(note.id) ,note: note);
          },
        ),
      ),
    );
  }
}
