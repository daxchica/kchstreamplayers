import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HuancaPlayer extends StatefulWidget {
  const HuancaPlayer({Key? key}) : super(key: key);

  @override
  _HuancaPlayerState createState() => _HuancaPlayerState();
}

class _HuancaPlayerState extends State<HuancaPlayer> {
  String url = 'https://streamingecuador.net:7078/stream';

  //Audio Player
  IconData btnIcon = Icons.play_arrow;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = '';

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              //  passing this to our root
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Radio Huancavilca',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('images/huanca_logo.png'),
                  IconButton(
                      icon: Icon(btnIcon, color: Colors.black, size: 50),
                      onPressed: () {
                        if (!isPlaying) {
                          playMusic(url);
                          setState(() {
                            btnIcon = Icons.pause;
                            isPlaying = true;
                          });
                        } else {
                          audioPlayer.stop();
                          setState(() {
                            btnIcon = Icons.play_arrow;
                            isPlaying = false;
                          });
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.phone),
                      AutoSizeText(
                        '093 906 4155',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.facebook),
                      AutoSizeText(
                        ' @huancavilca830am',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.twitter),
                      AutoSizeText(
                        ' @RadioHuancavilk',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.instagram),
                      AutoSizeText(
                        ' @radiohuancavilca',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(FontAwesomeIcons.youtube),
                      AutoSizeText(
                        ' Radio Huancavilca 830 AM',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(),
              //   child: Text("Change URL"),
              //   onPressed: () async {
              //     _flutterRadioPlayer.setUrl(
              //       "http://209.133.216.3:7018/;stream.mp3",
              //       "false",
              //     );
              //   },
              // )
            ),
          ),
        ),
      ),
    );
  }
}
