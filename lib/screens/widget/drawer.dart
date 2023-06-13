import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:en_bd_translator_app/utils/onshare.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/appurls.dart';
import '../about_page.dart';
import 'exit_allert_dialog.dart';

class DrawerR extends StatelessWidget {
  const DrawerR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                height: 150,
                //width: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.deepPurple.shade800,
                        Colors.red.shade800
                      ]),
                ),
                child: Image.asset("assets/featuresrbgpreview.png",
                    fit: BoxFit.fitWidth),
              ),
              const Divider(color: colorsUsed.bcolor, thickness: 1),
              ListTile(
                tileColor: Colors.orange[800],
                leading:
                    const Icon(Icons.home_outlined, color: colorsUsed.bcolor),
                title: const Text(
                  "Home",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip, color: colorsUsed.bcolor),
                title: const Text(
                  "Privacy Policy",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://sites.google.com/view/codecreative-privecypolicy/home'));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: colorsUsed.bcolor),
                title: const Text(
                  "About This App",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, color: colorsUsed.bcolor),
                title: const Text(
                  "Rate This App",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  launchUrl(
                    Uri.parse(appplayUrl),
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.android, color: colorsUsed.bcolor),
                title: const Text(
                  "More Apps",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  // Navigator.pop(context);
                  launchUrl(
                    Uri.parse(
                        'https://play.google.com/store/apps/dev?id=6563206073573597937'),
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: colorsUsed.bcolor),
                title: const Text(
                  "Share App",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  OnShare.onShare(appplayUrl, context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: colorsUsed.bcolor),
                title: const Text(
                  "Exit",
                  style: TextStyle(color: colorsUsed.bcolor),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ExitAllertDialog();
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
