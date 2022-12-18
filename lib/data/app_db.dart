import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:notepad_minus_minus/data/table_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'NotesData_db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [Notes])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Note>> getAllNotes() => select(notes).get();

  Future<Note> getNote(int id) {
    return (select(notes)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateNote(Note note) async {
    return await update(notes).replace(note);
  }

  updateNoteOrder(int id, int newOrder) {
    update(notes)
      ..where((tbl) => tbl.id.equals(id))
      ..write(NotesCompanion(order: Value(newOrder)));
  }

  void insertNote(NotesCompanion note) {

    into(notes).insert(note);
  }

  Future<int> deleteNote(Note note) async {
    return await delete(notes).delete(note);
  }

  Stream<List<Note>> watchNotes() {
    return select(notes).watch();
  }

  Future<List<Note>> getNotesByOrder() async {
    return await (select(notes)
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.order)]))
        .get();
  }

  //удалить если не понадобится
  Future reorderNotes(Note note) {
    return (update(notes)..where((t) => t.id.isBiggerThanValue(note.id)))
        .write(NotesCompanion(id: Value(note.id + 1)));
  }
}
