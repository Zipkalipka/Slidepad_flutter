import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:notepad_minus_minus/utilities/constants.dart';
import 'package:provider/provider.dart';

import '../data/app_db.dart';
import '../screens/addons/popup_alert.dart';
import '../utilities/title_input_formatter.dart';
import '../utilities/drift_provider.dart';
import '../utilities/editPage_controller.dart';

class EditPage extends StatefulWidget {
  final Note? note;

  const EditPage({Key? key, this.note}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool isEnabled = false;
  late FocusNode textFocus;
  final textController = TextEditingController();
  final titleTextController = TextEditingController();
  late Icon lastTitleIcon;

  // late Color titleBackColor;

  @override
  void initState() {
    super.initState();
    textFocus = FocusNode();
    lastTitleIcon = const Icon(Icons.edit);
  }

  @override
  void dispose() {
    textFocus.dispose();
    textController.dispose();
    titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DriftProvider driftProvider = Provider.of<DriftProvider>(context);
    if (widget.note != null) {
      textController.text = widget.note!.noteContent;
      titleTextController.text = widget.note!.title;
    }
    return WillPopScope(
      onWillPop: () async {
        if (widget.note == null) {
          if (textController.text.isNotEmpty) {
            driftProvider.insertNote(
                titleTextController.text,
                textController.text,
                DateTime.now());
            popUpToast(context, savedText);
          }
        } else {
          Note note = widget.note!.copyWith(
              title: titleTextController.text,
              noteContent: textController.text,
              datetime: DateTime.now());
          driftProvider.updateNote(note);
          popUpToast(context, savedText);
        }
        return true;
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            centerTitle: true,
            actions: [
              Container(
                  margin: editButtonMargin,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (isEnabled == false) {
                            isEnabled = true;
                            lastTitleIcon = const Icon(Icons.save);
                            SchedulerBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              FocusScope.of(context).requestFocus(textFocus);
                            });
                          } else {
                            isEnabled = false;
                            lastTitleIcon = const Icon(Icons.edit);
                          }
                        });
                      },
                      icon: lastTitleIcon)),
            ],
            title: Container(
              height: ctHeight,
              width: ctWidth,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isEnabled
                      ? Colors.white
                      : Theme.of(context).appBarTheme.foregroundColor,
                  borderRadius: ctBrdRad),
              child: SizedBox(
                height: sbTFHeight,
                width: sbTFWidth,
                child: TextField(
                  style: titleStyle.copyWith(
                      color: isEnabled
                          ? Colors.black54
                          : Theme.of(context).primaryColorLight),
                  textAlign: TextAlign.center,
                  enabled: isEnabled,
                  controller: titleTextController,
                  autofocus: false,
                  inputFormatters: [TitleCutter(titleStyle, sbTFWidth.toInt())],
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: editPageTitleHintText,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          body: GestureDetector(
            onDoubleTap: () {
              if (isEnabled == false) {
                setState(() {
                  isEnabled = true;
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    FocusScope.of(context).requestFocus(textFocus);
                  });
                });
              }
            },
            onTap: () {
              popUpToast(context, doubleTapText);
            },
            child: Container(
              margin: textEdges,
              child: TextField(
                controller: textController,
                autofocus: false,
                enabled: isEnabled,
                focusNode: textFocus,
                expands: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: textFieldStyle,
                decoration: const InputDecoration(
                    hintText: editPageTextHintText, border: InputBorder.none),
              ),
            ),
          )),
    );
  }
  void saveNote() {
    DriftProvider driftProvider = Provider.of<DriftProvider>(context);
    if (widget.note == null) {
      if (textController.text.isNotEmpty) {
        driftProvider.insertNote(
            titleTextController.text,
            textController.text,
            DateTime.now());
        popUpToast(context, savedText);
      }
    } else {
      Note note = widget.note!.copyWith(
          title: titleTextController.text,
          noteContent: textController.text,
          datetime: DateTime.now());
      driftProvider.updateNote(note);
      popUpToast(context, savedText);
    }
  }
}

