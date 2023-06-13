// import 'package:clipboard/clipboard.dart';
// import 'package:flutter/material.dart';
// import 'package:translator/translator.dart';

// class InputText extends StatefulWidget {
//   @override
//   _InputTextState createState() => _InputTextState();
// }

// class _InputTextState extends State<InputText> {
//   final translator = GoogleTranslator();
//   TextEditingController _textEditingController = TextEditingController();
//   var text;
//   @override
//   Widget build(BuildContext context) {
//     String fromLanguage = Provider.of<TranslatorData>(context).fromLanguageValue;
//     String toLanguage = Provider.of<TranslatorData>(context).toLanguageValue;
//     return CustomCard(
//       expandedChild: TextField(
//         controller: _textEditingController,
//         autocorrect: true,
//         autofocus: true,
//         onChanged: (value) async {
//           if (value.isEmpty) {
//             text = '';
//             Provider.of<TranslatorData>(context, listen: false).updateText(text: '');
//           } else {
//             text = await translator.translate(value, from: fromLanguage, to: toLanguage);
//             Provider.of<TranslatorData>(context, listen: false).updateText(text: text.toString());
//           }
//         },
//         maxLines: 12,
//         style: TextStyle(fontSize: 16),
//         decoration: InputDecoration(
//           hintText: 'Enter text',
//           border: OutlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//       actionButtonList: [
//         ActionButton(
//           iconData: Icons.copy,
//           onPressed: () => FlutterClipboard.copy(_textEditingController.text),
//         ),
//         ActionButton(
//           iconData: Icons.paste,
//           onPressed: () {
//             FlutterClipboard.paste().then((value) async {
//               setState(() {
//                 _textEditingController.text += value;
//               });
//               text = await translator.translate(value, from: fromLanguage, to: toLanguage);
//               Provider.of<TranslatorData>(context, listen: false).updateText(text: text);
//             });
//           },
//         ),
//         // ActionButton(
//         //   iconData: Icons.volume_up,
//         //   onPressed: () {},
//         // ),
//         ActionButton(
//           iconData: Icons.close,
//           onPressed: () => _textEditingController.clear(),
//         ),
//         SizedBox(
//           width: 20.0,
//         ),
//       ],
//       cardColor: Colors.white,
//     );
//   }
// }