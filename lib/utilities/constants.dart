import 'package:flutter/material.dart';

//Edit Page constants
//
//
//Text fields Hint text
const String editPageTitleHintText = 'Enter title';
const String editPageTextHintText = 'Enter text here...';
//AppBar
//Edit Button margin
const EdgeInsets editButtonMargin = EdgeInsets.only(right: 5);
//
//Title Text Field
//
//Outer Text Field Container
double ctHeight= 40.0;
double ctWidth = 200.0;
BorderRadius ctBrdRad = BorderRadius.circular(10);
//Text Field Sized Box
double sbTFHeight = 40.0;
double sbTFWidth = 180.0;
//Main Text Field margin
const EdgeInsets textEdges = EdgeInsets.only(left: 10, right: 10);
//
const TextStyle titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const textFieldStyle = TextStyle(fontSize: 20);
//
//Toast const
const String savedText = 'Note saved';
const String deletedText = 'Note deleted';
const String doubleTapText = 'Double tap\n to edit';

//Note Page constants
//
//
//AppBar
//AppBar Title
const Text appBarTitle = Text('Notepad--');
//
//Bottom Nav Bar
//BotNavBar Height
const double botNavBarHeight = 50.0;
//BotNavBar Spacer width
const double sbBNBWidth = 35.0;
//BotNavBar Icon Size
const double iconBNBSize = 25.0;
//
//ListView constants
//ListView padding from sides
const EdgeInsets listLRPadding = EdgeInsets.symmetric(horizontal: 5);
//
//Slidable constants
//Slidable move distance
const double sldExtentRatio = 0.4;
//Slidable Archive Button box
const Color sldArchiveColor = Colors.orangeAccent;
const double sldArchiveWidth=70;
const double sldArchiveHeight=70;
//Slidable Delete Button box
const Color sldDeleteColor = Colors.redAccent;
const double sldDeleteWidth=70;
const double sldDeleteHeight=70;
const BorderRadius sldDeleteRad = BorderRadius.horizontal(right: Radius.circular(5));
//Slidable Icon Size
const double sldIconSize=35.0;
//
//Tile constants
//Elevation
const double cardElevation = 10.0;
//Space between cards
const EdgeInsets spaceBetweenCards =EdgeInsets.symmetric(vertical: 5);