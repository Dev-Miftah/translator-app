import 'package:en_bd_translator_app/screens/widget/testHome.dart';
import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'traslator_screen.dart';
import 'widget/home_bottom_button.dart';
import 'widget/home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsUsed.primaryColor,
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "বাংলা থেকে ইংরেজি অনুবাদ \n এবং \nইংরেজি থেকে বাংলা আনুবাদ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorsUsed.blackTextcolor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/appstore.png",
                        ),
                        fit: BoxFit.contain),
                    //shape: BoxShape.circle
                  )),
              const Spacer(),
              Container(
                height: 180,
                color: Colors.red,
              ),
              const Spacer(),
              HomeButton(
                title: "অনুবাদ করুন",
                colors: colorsUsed.color.withOpacity(0.7),
                onPrees: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TraslatorScreen()));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeButton(
                    bWidth: MediaQuery.of(context).size.width * 0.4,
                    title: "আরো অ্যাপস",
                    colors: colorsUsed.color.withOpacity(0.7),
                    onPrees: () {},
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  HomeButton(
                    bWidth: MediaQuery.of(context).size.width * 0.4,
                    title: "রেট করুন",
                    colors: colorsUsed.color.withOpacity(0.7),
                    onPrees: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeBottomButton(
                      bHeight: 40,
                      bWidth: 40,
                      onPrees: () {},
                      icons: const Icon(Icons.info_outline_rounded)),
                  const SizedBox(
                    width: 15,
                  ),
                  HomeBottomButton(
                      bHeight: 40,
                      bWidth: 40,
                      onPrees: () {},
                      icons: const Icon(Icons.share_outlined)),
                  const SizedBox(
                    width: 15,
                  ),
                  HomeBottomButton(
                      bHeight: 40,
                      bWidth: 40,
                      onPrees: () {},
                      icons: const Icon(Icons.refresh)),
                  const SizedBox(
                    width: 15,
                  ),
                  HomeBottomButton(
                      bHeight: 40,
                      bWidth: 40,
                      onPrees: () {},
                      icons: const Icon(Icons.privacy_tip_outlined)),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
            ]),
      )),
    );
  }
}
