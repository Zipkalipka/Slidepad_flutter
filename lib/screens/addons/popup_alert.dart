import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

popUpToast(BuildContext context, String toastText) {
  return Fluttertoast.showToast(
    msg: toastText,
    gravity: ToastGravity.CENTER,
    backgroundColor: Theme.of(context).primaryColor,
  );
}
// void popUpToast(context,text) {
//   final fToast = FToast();
//   fToast.init(context);
//   Widget toast = Container(
//     key: UniqueKey(),
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(8.0),
//       color: Theme.of(context).hintColor,
//     ),
//     child: Text(text,style: Theme.of(context).textTheme.caption),
//   );
//
//   fToast.showToast(
//       child: toast,
//       toastDuration: const Duration(seconds: 1),
//       positionedToastBuilder: (context, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               child: child,
//               bottom: 100,
//             ),
//           ],
//         );
//       }
//   );
// }
