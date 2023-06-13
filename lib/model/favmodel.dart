import 'langmodel.dart';

class TranslateText {
  final int id;
  final String ftext;
  final String totext;
 // final bool isFavorit;

  TranslateText({
   required this.id,
    required this.ftext,
    required this.totext,
    //required this.isFavorit,
  });
}

List<TranslateText>favTextlist=[];
//List<Language>mainTextlist=[];