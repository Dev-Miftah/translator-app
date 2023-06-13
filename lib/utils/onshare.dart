  
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class OnShare {
  static void onShare(String message, BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      message,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
  }