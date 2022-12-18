import '../data/app_db.dart';

class DriftProvider {
  static final AppDb _appDb = AppDb();

  //getDb-отладочная
  AppDb getDb() => _appDb;

  Future<void> deleteAll() async{
    final noteList = await _appDb.getAllNotes();
    for (Note iNote in noteList){
      _appDb.deleteNote(iNote);
    }
  }
  //поробовать везде заменить getNotes на Provider.of<list<Note>(context, listen:false)
  Future<void> insertNote(
      String title, String noteContent, DateTime datetime) async {
    const int order = 0;
    final noteList = await _appDb.getAllNotes();
    for (Note iNote in noteList) {
      int newOrder = iNote.order + 1;
      await _appDb.updateNoteOrder(iNote.id, newOrder);
    }
    _appDb.insertNote(NotesCompanion.insert(
        title: title,
        noteContent: noteContent,
        datetime: datetime,
        order: order));
  }

  Future<void> deleteNote(Note note) async {
    int newOrder;
    _appDb.deleteNote(note);
    final noteList = await _appDb.getAllNotes();
    for (Note iNote in noteList) {
      if (iNote.order > note.order) {
        newOrder = iNote.order - 1;
        await _appDb.updateNoteOrder(iNote.id, newOrder);
      }
    }
  }

  Stream<List<Note>> noteListener() {
    return _appDb.watchNotes();
  }

  Future<List<Note>> getNotes() {
    return _appDb.getAllNotes();
  }

  Future<void> reorderNotes(int oldIndex, int newIndex) async {
    final noteList = await _appDb.getAllNotes();
    for (Note iNote in noteList) {
      int reorder;
      //тут логику неплохо было бы причесать
      //перемещение вниз
      if ((oldIndex < iNote.order) && (iNote.order <= newIndex)) {
        reorder = iNote.order - 1;
        await _appDb.updateNoteOrder(iNote.id, reorder);
      //перемещение вверх
      } else if ((newIndex <= iNote.order) && (iNote.order < oldIndex)) {
        reorder = iNote.order + 1;
        await _appDb.updateNoteOrder(iNote.id, reorder);
      } else if (iNote.order == oldIndex) {
        reorder = newIndex;
        await _appDb.updateNoteOrder(iNote.id, reorder);
      }
    }
  }

  void updateNote(Note note) => _appDb.updateNote(note);

  List<Note> initialData(){
    return [];
  }
}
