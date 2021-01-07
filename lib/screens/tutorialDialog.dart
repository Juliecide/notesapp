import 'package:flutter/material.dart';
import 'package:notesapp/components/sharedPrefProvider.dart';

class TutorialDialog extends StatefulWidget {
  @override
  _TutorialDialogState createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<TutorialDialog> {
  bool _dontShowThisAgain = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.yellow],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Welcome to the Haven app!\n\nThe aim of this app is to help you with your mental health and all-around well being. We will explain how the app works in the next few sentences, then feel free to explore what the app has to offer.",
                    style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\nJokes\nThe first page of this app is the jokes page. You can swipe left or right to scroll between jokes that we have hand-picked for you which might give you the extra energy you need to get through the day!",
                    style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\nMental Exercises\nThis page contains a mental exercise for you (e.g. find multi-sensory activities, draw something...). Feel free to do the exercise but there is no pressure to complete it. Don’t worry if you don’t like the current exercise because they change every 8 hours.",
                    style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\nDiary\nThe diary page is for you to have a safe place to put all of your thoughts if you wish to. It is pin protected and you can enter your personal pin when first entering the page. You can also change this pin whenever you want in the settings. The diary has ways for you to make it feel more personal with features like different color pages and is there to be a long-lasting tool for you with things like a search bar to help you get back to previous entries and the ability to flag an entry if you want to tag it for easier retrieval later.",
                    style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "\nWe hope you will go on to enjoy using this app and we hope it will help to improve your life both physically and mentally!",
                    style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _dontShowThisAgain,
                        onChanged: (value) => setState(() {
                          _dontShowThisAgain = !_dontShowThisAgain;
                        }),
                      ),
                      Text(
                        "Don't show this again",
                        style: TextStyle(
                          fontFamily: 'ZillaSlab',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.red,
                    child: Text(
                      "close",
                      style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => setState(
                      () {
                        _dontShowThisAgain
                            ? SharedPrefProvider.logIn(true)
                            : SharedPrefProvider.logIn(false);

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
