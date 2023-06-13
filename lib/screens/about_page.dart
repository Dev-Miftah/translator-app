import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:en_bd_translator_app/utils/onshare.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/appurls.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "ABOUT",
          style: TextStyle(
            fontSize: 22,
            color: colorsUsed.color,
            //fontWeight: FontWeight.w300
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.deepPurple.shade800, Colors.red.shade800]),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.black),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/fbbcapplogo.png",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "ফেসবুক স্ট্যাটাস ও ক্যাপশন",
                      style: TextStyle(
                        fontFamily: 'Galada Regular',
                        fontSize: 26,
                        color: colorsUsed.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      height: 70,
                      child: Image.asset("assets/ccfeatured.png",
                          fit: BoxFit.fill)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "বাছাইকৃত সেরা ফেসবুক স্ট্যাটাস ও ক্যাপশন কালেকশন...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Galada Regular',
                      fontSize: 18,
                      color: colorsUsed.color,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            OnShare.onShare(appplayUrl, context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(colorsUsed.bcolor)),
                          child: const Text('SHARE APP')),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            launchUrl(
                              Uri.parse(appplayUrl),
                              mode: LaunchMode.externalNonBrowserApplication,
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(colorsUsed.bcolor)),
                          child: const Text('RATE APP')),
                    ),
                  ]),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
