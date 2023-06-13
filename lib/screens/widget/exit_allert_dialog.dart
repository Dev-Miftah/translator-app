import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitAllertDialog extends StatelessWidget {
  const ExitAllertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Do you want to Exit'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colorsUsed.bcolor)),
                child: const Text('No')),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pop(true);
                  SystemNavigator.pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colorsUsed.bcolor)),
                child: const Text('Yes'))
          ],
        ),
      ],
    );
  }
}
