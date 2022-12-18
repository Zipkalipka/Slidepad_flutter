
import 'package:intl/intl.dart';

class NoteAssist {
  static DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  String parseDate(DateTime date){
    return dateFormat.format(date);
    // return 'Last edit: '
    //     '${date.day}-'
    //     '${date.month}-'
    //     '${date.year} '
    //     '${date.hour}:'
    //     '${date.minute}';
  }
  String parseTitle(String title, String noteContent) {
    if (title=='') {
      if (noteContent.length>10) {
        return '${noteContent.substring(0, 9)}...';
      } else {
        return noteContent;
      }
    } else {
      return title;
    }
  }
}