import 'package:avatar_glow/avatar_glow.dart';
import 'package:en_bd_translator_app/screens/widget/home_button.dart';
import 'package:en_bd_translator_app/utils/toastbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share_plus/share_plus.dart';
import '../../model/favmodel.dart';
import '../model/langmodel.dart';
import '../utils/onshare.dart';
import 'favourite_screen.dart';


import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'widget/drawer.dart';
import 'widget/exit_allert_dialog.dart';
import 'widget/home_bottom_button.dart';

class TraslatorScreen extends StatefulWidget {
  const TraslatorScreen({Key? key}) : super(key: key);

  @override
  State<TraslatorScreen> createState() => _TraslatorScreenState();
}

class _TraslatorScreenState extends State<TraslatorScreen> {
  TextEditingController fromContoller = TextEditingController();
  TextEditingController toContoller = TextEditingController();
  final translator = GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();
  //late stt.SpeechToText _speechToText;
  bool isFavourite = false;
  bool isPlaying = false;
  final stt.SpeechToText _speachtoText = stt.SpeechToText();
  bool isListening = false;

  Language _firstLanguage = Language('bn', 'বাংলা (bn)');
  Language _secondLanguage = Language('en', 'ইংরেজি (en)');

  _translateLang() {
    translator
        .translate(fromContoller.text,
            to: _firstLanguage.code.toString(),
            from: _secondLanguage.code.toString())
        .then((result) {
      setState(() {
        toContoller.text = result.toString();
      });
    });
  }

  void _switchLanguage() {
    Language _tmpLanguage = _firstLanguage;

    setState(() {
      _firstLanguage = _secondLanguage;
      _secondLanguage = _tmpLanguage;
    });
  }

  textTospetch(lang, output) async {
    await flutterTts.setLanguage(lang);
    await flutterTts.setPitch(0.7);
    await flutterTts.speak(output.toString());
  }


  listen() async {
        if (isListening == false) {
      bool available = await _speachtoText.initialize(
          onStatus: (val) => print("onStatus: $val"), 
          onError: (val) => setState(() {
        print("onError: $val");
        isListening = false;
        _speachtoText.isListening;
        _speachtoText.stop();
      }),
      finalTimeout: const Duration(seconds: 7),
          );
      
      if (available) {
        setState(() {
          isListening = true;
            ToastBar.toastMessage("Try Saying Something");
        });
        _speachtoText.listen(onResult: (value) {
          fromContoller.text = value.recognizedWords;
        
        });
      }
    } else {
      setState(() {
        isListening = false;
        
        _speachtoText.isListening;
        _speachtoText.stop();
      });
    }
  }

  var numOfItems = 0;
  

  //int get count => favList.length;
  void addFavToList(TranslateText translateText) {
    String favText = fromContoller.text+toContoller.text;
    if (fromContoller.text != "") {
      
      favTextlist.add(translateText);
      //favTextlist.add(toContoller.text);
      numOfItems++;
    } else {
      ToastBar.toastMessage(
        "Already Added \nYou have already added this to the Favourite list",
      );
}

  }

  //get products => favList;

  @override
  void initState() {
    super.initState();
    //_speechToText = stt.SpeechToText();
    
    //_initSpeech();
  }

  @override
  void dispose() {
    super.dispose();
    toContoller.dispose();
    fromContoller.dispose();
    flutterTts.stop();
    listen();
    //_speechToText.stop();
    _speachtoText.stop();
  }

  @override
  Widget build(BuildContext context) {
    void press() {
      final fromText = fromContoller.text;
      if (fromText != "") {
        // clickCount++;
        // if (clickCount == 2) {
        //   adManager.showInterstitialAd();
        //   clickCount = 0;
        // }
        _translateLang();
      } else {
        ToastBar.toastMessage(
            "Enter Some Text To Translate \nঅনুবাদ করতে দয়া করে কোন পাঠ্য প্রবেশ করুন");
      }
    }

    return WillPopScope(
      onWillPop: () async {
        final val = await showDialog<bool>(
            context: context,
            builder: (context) {
              return const ExitAllertDialog();
            });
        if (val != null) {
          return Future.value(val);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: colorsUsed.primaryColor,
          centerTitle: true,
          title: Container(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _secondLanguage.name.toString(),
                  style: const TextStyle(
                      fontSize: 17, color: colorsUsed.whiteTextcolor),
                ),
                IconButton(
                    onPressed: _switchLanguage,
                    icon: const Icon(Icons.compare_arrows)),
                Text(
                  _firstLanguage.name.toString(),
                  style: const TextStyle(
                      fontSize: 17, color: colorsUsed.whiteTextcolor),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavouriteScreen()));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            const SizedBox(width: 4),
          ],
        ),
        drawer: const DrawerR(),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.7,
                        width: double.infinity,
                        //height: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey.withOpacity(0.3),
                          border: Border.all(color: colorsUsed.bcolor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: fromContoller,
                                textAlign: TextAlign.start,
                                minLines: 6,
                                maxLines: 8,
                                style: const TextStyle(
                                    color: colorsUsed.blackTextcolor, fontSize: 18),
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      color: colorsUsed.bcolor.withOpacity(0.7),
                                      fontSize: 18,
                                    ),
                                    hintText:
                                        "Enter Some Text To Translate \nঅনুবাদ করতে দয়া করে কোন পাঠ্য প্রবেশ করুন",
                                    contentPadding:
                                        const EdgeInsets.only(left: 20, top: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                             const SizedBox(height: 6),
                            //const Spacer(),
                            Container(
                               padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 6),
                              height: 50,
                              width: double.infinity,
                              // decoration: BoxDecoration(
                              //   borderRadius:
                              //       const BorderRadius.all(Radius.circular(15)),
                              //   color: colorsUsed.primaryColor,
                              //   border: Border.all(color: Colors.black),
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                        
                                  HomeBottomButton(
                                      onPrees: () {
                                        final fromText = fromContoller.text;
                                        if (fromText != "") {
                                          final value = ClipboardData(
                                              text: fromContoller.text);
    
                                          Clipboard.setData(value).then((value) =>
                                                  ToastBar.toastMessage(
                                                      "Text Copied")
                                              //print(toContoller.text)
                                              );
                                        } else {
                                          ToastBar.toastMessage(
                                              "Enter Some Text To Copy");
                                        }
                                      },
                                      icons: const Icon(
                                        Icons.copy,
                                        color: colorsUsed.bcolor,
                                        size: 25,
                                      )),
                                 const SizedBox(width: 5),
                                  HomeBottomButton(
                                      bHeight: 40,
                                      bWidth: 40,
                                      onPrees: ()async {
                                        final clipPaste = await Clipboard.getData(Clipboard.kTextPlain);
                                        setState(() {
                                         
                                          
                                          fromContoller.text = clipPaste!.text.toString();
                                          
                                        });
                                      },
                                      icons: const Icon(
                                        Icons.paste,
                                        color: colorsUsed.bcolor,
                                        size: 25,
                                      )),
                                  const SizedBox(width: 5),
                                  HomeBottomButton(
                                      bHeight: 40,
                                      bWidth: 40,
                                      onPrees: () {
                                        final fromText = fromContoller.text;
                                        if (fromText != "") {
                                          textTospetch(_firstLanguage.toString(),
                                              fromContoller.text);
                                        } else {
                                          ToastBar.toastMessage(
                                              "Write Something Text To Play");
                                        }
                                      },
                                      icons: const Icon(
                                        Icons.volume_up_outlined,
                                        color: colorsUsed.bcolor,
                                        size: 25,
                                      )),
                                  const SizedBox(width: 5),
                                  HomeBottomButton(
                                    onPrees: () {
                                      listen();
                                      }, 
                                  icons: AvatarGlow(
          animate: isListening,
          glowColor: Colors.red,
          endRadius: 200,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: isListening
                  ? const Icon(
                      Icons.mic,
                      color: colorsUsed.bcolor,
                                        size: 25,
                    )
                  : const Icon(Icons.mic_none, color: colorsUsed.bcolor,
                                        size: 25,)),
                                  
                                  ),
                                  const SizedBox(width: 5),
                                  HomeBottomButton(
                                      bHeight: 40,
                                      bWidth: 40,
                                      onPrees: () {
                                        fromContoller.clear();
                                        toContoller.clear();
                                        flutterTts.stop();
                                       
                                        setState(() {
                                          isListening = false;
                                        });
                                        
                                      },
                                      icons: const Icon(
                                        Icons.close,
                                        color: colorsUsed.bcolor,
                                        size: 25,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: HomeButton(
                                  title: "Translate",
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                  colors: colorsUsed.primaryColor,
                                  onPrees: () => press()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Container(
                    //   height: 70,
                    //   color: Colors.red,
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        //height: 300,
                        height: MediaQuery.of(context).size.height / 2.7,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: colorsUsed.primaryColor,
                          border: Border.all(color: colorsUsed.bcolor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextField(
                                
                                controller: toContoller,
                                style: const TextStyle(
                                    color: colorsUsed.color, fontSize: 18),
                                keyboardType: TextInputType.none,
                                minLines: 7,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      color: colorsUsed.whiteTextcolor
                                          .withOpacity(0.8),
                                      fontSize: 18,
                                    ),
                                    hintText: "Translated Text \nঅনুবাদিত পাঠ",
                                    contentPadding:
                                        const EdgeInsets.only(left: 20, top: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                             const SizedBox(height: 6),
                            //const Spacer(),
                            Container(
                              height: 50,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 6),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                //color: colorsUsed.primaryColor,
                                //border: Border.all(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HomeBottomButton(
                                      onPrees: () {
                                        final toText = toContoller.text;
                                        if (toText != "") {
                                          final value = ClipboardData(
                                              text: toContoller.text);
    
                                          Clipboard.setData(value).then(
                                              (value) => ToastBar.toastMessage(
                                                  "Text Copied")
                                              //print(toContoller.text)
                                              );
                                        } else {
                                          ToastBar.toastMessage(
                                              "Enter Some Text To Translate \nঅনুবাদ করতে দয়া করে কোন পাঠ্য প্রবেশ করুন");
                                        }
                                      },
                                      icons: const Icon(
                                        Icons.copy,
                                      )),
                                  const SizedBox(width: 5),
                                  HomeBottomButton(
                                      onPrees: () {
                                        final toText = toContoller.text;
                                        if (toText != "") {
                                          // final box = context.findRenderObject()
                                          //     as RenderBox;
                                          // Share.share(toContoller.text,
                                          //     sharePositionOrigin:
                                          //         box.localToGlobal(
                                          //                 Offset.zero) &
                                          //             box.size);
                                          OnShare.onShare(toContoller.text, context);
                                        } else {
                                          ToastBar.toastMessage(
                                              "Translate Some Text To Share");
                                        }
                                      },
                                      icons: const Icon(
                                        Icons.share_outlined,
                                      )),
                                 const SizedBox(width: 5),
                                  HomeBottomButton(
                                      onPrees: () {
                                        final toText = toContoller.text;
                                        final fromText = fromContoller.text;
                                        addFavToList(TranslateText(ftext: fromText, totext: toText, id: 0));
                                      },
                                      icons: const Icon(
                                        Icons.favorite_border,
                                      )),
                                  const SizedBox(width: 5),
                                  HomeBottomButton(
                                      onPrees: () {
                                        final toText = toContoller.text;
                                        if (toText != "") {
                                          textTospetch(
                                              _secondLanguage.toString(),
                                              toContoller.text);
                                        } else {
                                          ToastBar.toastMessage(
                                              "Translate Something Text To Play");
                                        }
                                      },
                                      icons: const Icon(
                                        Icons.volume_up_outlined,
                                      )),
                                   const SizedBox(width: 5),
                                  HomeBottomButton(
                                      bHeight: 40,
                                      bWidth: 40,
                                      onPrees: () {
                                        toContoller.clear();
                                        flutterTts.stop();
                                        
                                      },
                                      icons: const Icon(Icons.close)),
                                  HomeBottomButton(
                                      bHeight: 40,
                                      bWidth: 40,
                                      onPrees: () {
                                        fromContoller.clear();
                                        toContoller.clear();
                                        setState(() {
                                          isListening = false;
                                        });
                                        flutterTts.stop();
                                        ToastBar.toastMessage(
                                              "Refreshing");
                                      },
                                      icons: const Icon(Icons.refresh_sharp)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.red,
        ),
      ),
    );
  }
}
