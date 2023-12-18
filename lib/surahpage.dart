// ignore_for_file: await_only_futures, avoid_print, camel_case_types

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

class surahpage extends StatefulWidget {
  final int surahindex;
  const surahpage({super.key, required this.surahindex});

  @override
  State<surahpage> createState() => _surahpageState();
}

class _surahpageState extends State<surahpage> {
  AudioPlayer audioplayer = AudioPlayer();
  IconData playpausebutton = Icons.play_circle_fill_rounded;
  bool isPlaying = false;

  Future<void> togglebutton() async {
    try {
      final audiourl =
          await quran.getAudioURLByVerseNumber(widget.surahindex + 9);
      audioplayer.setUrl(audiourl);
      if (isPlaying) {
        setState(() {
          audioplayer.play();
          playpausebutton = Icons.pause_circle_rounded;
          isPlaying = false;
        });
      } else {
        audioplayer.pause();
        playpausebutton = Icons.play_circle_rounded;
        isPlaying = true;

        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding:  const EdgeInsets.only(right: 30),
            child: Column
            (crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              FlipInX(
                  child: Text(
                      quran.getSurahNameArabic(widget.surahindex + 1),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 147, 111, 1),
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          height: 0,
                      ),
                  ),
                ),
                 FlipInY(
                   child: Text(
                                    'Total Verses  ${quran.getVerseCount(widget.surahindex+1)}' ,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color:Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                    ),
                                ),
                 ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: quran.getVerseCount(widget.surahindex + 1),
              
              itemBuilder: (context, index) {
                return FadeInUp(
                  child: ListTile(
                    title: Text(
                      quran.getVerse(widget.surahindex + 1, index + 1,
                          verseEndSymbol: false),
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 23),
                    ),
                    leading: IconButton(
                        onPressed: () async {
                          try {
                            final audiourl = await quran
                                .getAudioURLByVerse(widget.surahindex + 1 , index+1);
                            audioplayer.setUrl(audiourl);
                          audioplayer.play();
                          } catch (e) {
                            print(e);
                          }
                        },
                        icon: Icon(playpausebutton)),
                  ),
                );
              },
            ),
          ),
         
        ],
      ),
    );
  }
}
