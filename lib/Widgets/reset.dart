import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget reset({
  required Function fun,
  required BuildContext context,
}) =>
    CupertinoButton(
        onPressed: () {
          showCupertinoDialog<void>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('صكة جديدة'),
              content: const Text('هل تريد صكة جديدة؟'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  child: const Text('لا'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                    child: const Text('نعم'),
                    isDestructiveAction: true,
                    onPressed: () {
                      fun();
                      Navigator.pop(context);
                    })
              ],
            ),
          );
        },
        child: const Icon(
          Icons.clear,
          color: Colors.white,
          size: 30,
        ));
