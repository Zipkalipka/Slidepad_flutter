import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notepad_minus_minus/data/app_db.dart';
import 'package:notepad_minus_minus/screens/addons/popup_alert.dart';
import 'package:notepad_minus_minus/utilities/constants.dart';
import 'package:notepad_minus_minus/utilities/drift_provider.dart';
import 'package:provider/provider.dart';
import '../../utilities/note_format_assistant.dart';
import '../../screens/editPage.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteAssist noteAssist = NoteAssist();
    DriftProvider driftProvider = Provider.of<DriftProvider>(context);
    return Slidable(
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: sldExtentRatio,
        motion: const BehindMotion(),
        children: [
          Container(
            width: sldArchiveWidth,
            height: sldArchiveHeight,
            decoration: const BoxDecoration(
              color: sldArchiveColor,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.archive,
                  size: sldIconSize,
                )),
          ),
          Container(
            width: sldDeleteWidth,
            height: sldDeleteHeight,
            decoration: const BoxDecoration(
                color: sldDeleteColor, borderRadius: sldDeleteRad),
            child: IconButton(
                onPressed: () {
                  driftProvider.deleteNote(note);
                  popUpToast(context, deletedText);
                },
                icon: const Icon(
                  Icons.delete,
                  size: sldIconSize,
                )),
          ),
        ],
      ),
      child: Card(
        borderOnForeground: false,
        elevation: cardElevation,
        color: Theme.of(context).cardTheme.color,
        margin: spaceBetweenCards,
        child: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditPage(note: note)));
          },
          title: Text(noteAssist.parseTitle(note.title, note.noteContent)),
          //VVVVV subject of removal?
          leading: const Icon(
            Icons.circle,
            color: Colors.red,
            size: 50,
          ),
          subtitle: Text('Last edit: ${noteAssist.parseDate(note.datetime)}'),
        ),
      ),
    );
  }
}
