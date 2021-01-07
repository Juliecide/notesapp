import 'package:flutter/material.dart';
import 'dart:math' as math;

class Jokes extends StatefulWidget {
  @override
  JokesState createState() => JokesState();
}

class JokesState extends State<Jokes> {
  var jokes = [
    'Light travels faster than sound. That\'s why some people appear bright until you hear them speak',
    'I was wondering why the ball was getting bigger. Then it hit me',
    'I have a few jokes about unemployed people, but none of them work',
    '"I have a split personality," said Tom, being frank.',
    'How do you make holy water? You boil the hell out of it',
    'I Renamed my iPod The Titanic, so when I plug it in, it says “The Titanic is syncing.”',
    'When life gives you melons, you\'re dyslexic',
    'Last night, I dreamed I was swimming in an ocean of orange soda. But it was just a Fanta sea',
    'Will glass coffins be a success? Remains to be seen',
    'I lost my job at the bank on my very first day. A woman asked me to check her balance, so I pushed her over',
    'It\'s hard to explain puns to kleptomaniacs because they always take things literally',
    'What’s the difference between a hippo and a zippo? One is really heavy and the other is a little lighter',
    'Two windmills are standing in a wind farm. One asks, “What’s your favorite kind of music?” The other says, “I’m a big metal fan.”',
    'Did you hear about the guy whose whole left side was cut off? He’s all right now',
    'I can’t believe I got fired from the calendar factory. All I did was take a day off',
    'The man who survived pepper spray and mustard gas is now a seasoned veteran',
    'My dad farted in an elevator, it was wrong on so many levels',
    'Hear about the new restaurant called Karma? There’s no menu - you get what you deserve',
    'I went to buy some camouflage trousers yesterday but couldn\'t find any',
    'What do you call a bee that can’t make up its mind? A maybe',
    'England doesn\'t have a kidney bank, but it does have a Liverpool',
    'I tried to sue the airline for losing my luggage. I lost my case',
    'A police officer just knocked on my door and told me my dogs are chasing people on bikes. That’s ridiculous. My dogs don’t even own bikes',
    'All chemists know that alcohol is always a solution',
    'Jill broke her finger today, but on the other hand she was completely fine',
    'When everything is coming your way, you\'re in the wrong lane',
    'The furniture store keeps calling me to come back. But all I wanted was one night stand',
    'A cross-eyed teacher couldn’t control his pupils',
    'She had a photographic memory but never developed it',
    'When the past, present, and future go camping they always argue. It\'s intense tense in tents',
    'What did the janitor say when he jumped out of the closet? SUPPLIES!',
    'Let me tell you about my grandfather. He was a good man, a brave man. He had the heart of a lion, and a lifetime ban from the zoo',
    'My dad, unfortunately, passed away when we couldn’t remember his blood type… His last words to us were, “Be positive!”',
    'Is it ignorance or apathy that\'s destroying the world today? I don\'t know and don\'t really care',
    'A mean crook going down stairs = A condescending con, descending',
    'What do you call the wife of a hippie? A Mississippi',
    'I wasn’t originally going to get a brain transplant, but then I changed my mind',
    'There was a kidnapping at school yesterday. Don’t worry, though - he woke up',
    'Which country’s capital has the fastest-growing population? Ireland. Every day it’s Dublin.',
    'How do you throw a space party? You planet'
  ];

  final _random = math.Random();

  int jokesIndex = 0;

  @override
  void initState() {
    super.initState();
    jokesIndex = _random.nextInt(jokes.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      body: GestureDetector(
        onTap: () => print("tapped on jokes"),
        onHorizontalDragEnd: (dragEndDetails) {
          if (dragEndDetails.primaryVelocity < 0)
            setState(() {
              jokesIndex == jokes.length - 1 ? jokesIndex = 0 : jokesIndex++;
            });
          else
            setState(() {
              jokesIndex == 0 ? jokesIndex = jokes.length - 1 : jokesIndex--;
            });
        },
        child: InkWell(
          onTap: () {
            setState(() {
              jokesIndex = _random.nextInt(jokes.length);
            });
          },
          child: Padding(
            padding: EdgeInsets.all(5),

            //TODO add arrows to the left and right of the jokes and also swipe support
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () => setState(() {
                      jokesIndex == 0
                          ? jokesIndex = jokes.length - 1
                          : jokesIndex--;
                    }),
                  ),
                  Flexible(
                    child: Text(
                      jokes[jokesIndex],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'ZillaSlab',
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () => setState(() {
                      jokesIndex == jokes.length - 1
                          ? jokesIndex = 0
                          : jokesIndex++;
                    }),
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
