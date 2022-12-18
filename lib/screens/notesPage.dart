import 'package:flutter/material.dart';
import '../screens/addons/popup_alert.dart';
import '../screens/editPage.dart';
import '../utilities/constants.dart';
import '../screens/notePage_elements/noteList.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
        ),
        body: const NotesList(),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: botNavBarHeight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        popUpToast(context, deletedText);
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: iconBNBSize,
                        color: Theme.of(context).iconTheme.color,
                      )),
                  IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.search,
                        size: iconBNBSize,
                        color: Theme.of(context).iconTheme.color,
                      )),
                  const SizedBox(
                    width: sbBNBWidth,
                  ),
                  IconButton(
                      onPressed: () {
                        //popUpAlert(context);
                      },
                      icon: Icon(
                        Icons.archive,
                        size: iconBNBSize,
                        color: Theme.of(context).iconTheme.color,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: iconBNBSize,
                        color: Theme.of(context).iconTheme.color,
                      ))
                ],
              ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          foregroundColor:
              Theme.of(context).floatingActionButtonTheme.foregroundColor,
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditPage()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
