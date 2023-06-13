import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/material.dart';

class HomeBottomButton extends StatelessWidget {
  final Widget icons;
  VoidCallback onPrees;
  double? bWidth;
  double? bHeight;
  HomeBottomButton(
      {Key? key,
      required this.onPrees,
      this.bWidth = 170,
      this.bHeight = 40,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 6),
      child: IconButton(
        color: colorsUsed.color.withOpacity(0.9),
        highlightColor: colorsUsed.bcolor,
        onPressed: onPrees,
        icon: icons,
      ),
    );
  }
}




// import 'package:en_bd_translator_app/utils/Colors.dart';
// import 'package:flutter/material.dart';

// class HomeBottomButton extends StatelessWidget {
//   final Icon icons;
//   VoidCallback onPrees;
//   double? bWidth;
//   double? bHeight;
//   HomeBottomButton(
//       {Key? key,
//       required this.onPrees,
//       this.bWidth = 170,
//       this.bHeight = 40,
//       required this.icons})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Container(
//         alignment: Alignment.center,
//         height: bHeight,
//         width: bWidth,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           color: colorsUsed.bcolor,
//           border: Border.all(color: colorsUsed.bcolor),
//         ),
//         child: IconButton(
//           color: colorsUsed.color.withOpacity(0.9),
//           highlightColor: colorsUsed.bcolor,
//           onPressed: onPrees,
//           icon: icons,
//         ),
//       ),
//     );
//   }
// }