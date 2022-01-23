import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget goBack({
  required Function fun,
  required BuildContext context,
 
}) =>
    CupertinoButton(
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('تراجع'),
            content: const Text('هل تريد التراجع؟'),
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
      child:  const Icon(
              Icons.replay,
              color: Colors.white,
              size: 30,
            )
    );
