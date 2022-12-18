import 'package:flutter/material.dart';

class Note {
  final int id;
  final String title;
  final String noteContent;
  final DateTime dateTime;
  final int order;
  Note(this.id, this.title, this.noteContent,this.dateTime,this.order);
}