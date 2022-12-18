import 'package:drift/drift.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 0, max: 32)();

  TextColumn get noteContent => text()();

  DateTimeColumn get datetime => dateTime()();

  IntColumn get order => integer()();
}
