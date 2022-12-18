import 'package:flutter/foundation.dart';
import 'package:notepad_minus_minus/data/app_db.dart' show Note ;
import 'package:notepad_minus_minus/utilities/drift_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class EditPageController with ChangeNotifier {
  final String text;
  final String title;
  final Note? note;
  final BuildContext context;
  EditPageController({required this.note, required this.text, required this.title, required this.context});

  void saveNote() {
    DriftProvider driftProvider = Provider.of<DriftProvider>(context);
    if (note == null) {
      if (text.isNotEmpty) {
        driftProvider.insertNote(
            title,
            text,
            DateTime.now());
      }
    } else {
      Note updnote = note!.copyWith(
          title: title,
          noteContent: text,
          datetime: DateTime.now());
      driftProvider.updateNote(updnote);
    }
  }
}