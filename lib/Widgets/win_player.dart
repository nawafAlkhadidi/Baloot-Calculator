import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future winWidget({
  required Function fun1,
  required Function fun2,
  required BuildContext context,
  required int sumPlayer1,
  required int sumPlayer2,
  required bool winPlayr1,
}) =>
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: winPlayr1
                ? const Text("كفو مبروك ")
                : const Text("فداك يعوضك الله (:"),
            content: Text(" لكم $sumPlayer2 ولهم $sumPlayer1"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('تراجع؟'),
                onPressed: () {
                  fun1();
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                  child: const Text('صكة جديدة؟'),
                  isDestructiveAction: true,
                  onPressed: () {
                    fun2();
                    Navigator.pop(context);
                  })
            ],
          );
        });
