import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class KchPlayer extends StatefulWidget {
  const KchPlayer({Key? key}) : super(key: key);

  @override
  _KchPlayerState createState() => _KchPlayerState();
}

class _KchPlayerState extends State<KchPlayer> {
  String url = 'https://streamingecuador.net:7075/stream';

  // Audio Player
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
            'Radio KCh FM',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            color: Colors.yellow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('images/kch_logo.png'),
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
                    },
                  ),
                  // Slider(
                  //   activeColor: Colors.black,
                  //   value: volume,
                  //   min: 0,
                  //   max: 1.0,
                  //   onChanged: (value) => setState(
                  //     () {
                  //       volume = value;
                  //       _flutterRadioPlayer.setVolume(volume);
                  //     },
                  //   ),
                  // ),
                  // AutoSizeText(
                  //   "Volume: " + (volume * 100).toStringAsFixed(0),
                  //   style: const TextStyle(fontSize: 20, color: Colors.black),
                  // ),
                  // StreamBuilder<dynamic>(
                  //   initialData: "",
                  //   stream: _flutterRadioPlayer.metaDataStream,
                  //   builder: (context, snapshot) {
                  //     return Text(snapshot.data);
                  //   },
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.phone,
                      ),
                      AutoSizeText(
                        '0967016456',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.facebook,
                      ),
                      AutoSizeText(
                        '@kchfmradio',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.twitter,
                      ),
                      AutoSizeText(
                        '@kch_fm',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                      ),
                      AutoSizeText(
                        '@kchfmradio',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.youtube,
                      ),
                      AutoSizeText(
                        '@kch fm radio',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
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
      ),
    );
  }
}
