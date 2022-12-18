import 'package:flutter/material.dart';
import 'package:notepad_minus_minus/data/app_db.dart';
import 'package:notepad_minus_minus/utilities/drift_provider.dart';
import 'package:provider/provider.dart';
import 'screens/notesPage.dart';

void main() => runApp(const NotepadMain());

class NotepadMain extends StatelessWidget {
  const NotepadMain({super.key});

  @override
  Widget build(BuildContext context) {
    final DriftProvider driftProvider = DriftProvider();
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context)=> driftProvider.noteListener(),
            //create: (context) => driftProvider.noteListener(),
            initialData: driftProvider.initialData()),
        Provider(create: (context)=>driftProvider)
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'Slidepad',
        home: const NotePage(),
      ),
    );
  }
}
