import 'package:en_bd_translator_app/model/favmodel.dart';
import 'package:en_bd_translator_app/screens/widget/home_bottom_button.dart';
import 'package:en_bd_translator_app/model/langmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/toastbar.dart';

class FavouriteScreen extends StatelessWidget {
  // final String fromTranlateText;
  // final String toTranlateText;
  const FavouriteScreen({Key? key}) : super(key: key);

   void removeFavText(TranslateText translateText) {
     favTextlist.remove(translateText);
      //numOfItems--;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Favourite"),
      ),
      body: SafeArea(
          child: Center(
        child: ListView.builder(
          itemCount: favTextlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(favTextlist[index].id.toString()),
          onDismissed: (direction) {
           favTextlist.remove(favTextlist.toList()[index]);
            
          },
          background: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: const [Spacer(), Icon(Icons.delete_outline)],
            ),
          ),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade600,
                          Colors.purple.shade300,
                          Colors.yellow.shade200
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                favTextlist[index].ftext,
                                style: const TextStyle(fontSize: 20),
                              ),
                              HomeBottomButton(
                                  bHeight: 40,
                                  bWidth: 40,
                                  onPrees: () {
                                    final value = ClipboardData(text: favTextlist[index].ftext);
                
                                    Clipboard.setData(value).then((value) =>
                                            ToastBar.toastMessage("Text Copied")
                                        //print(toContoller.text)
                                        );
                                  },
                                  icons: const Icon(Icons.copy))
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Translate To",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text(
                                favTextlist[index].totext,
                                style: const TextStyle(fontSize: 20),
                              ),
                              HomeBottomButton(
                                  bHeight: 40,
                                  bWidth: 40,
                                  onPrees: () {
                                    final value = ClipboardData(text: favTextlist[index].totext);
                
                                    Clipboard.setData(value).then((value) =>
                                            ToastBar.toastMessage("Text Copied")
                                        //print(toContoller.text)
                                        );
                                  },
                                  icons: const Icon(Icons.copy))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.red,
      ),
    );
  }
}
