import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

class OnlinePlay extends StatefulWidget {
  const OnlinePlay({super.key});

  @override
  State<OnlinePlay> createState() => _OnlinePlayState();
}

class _OnlinePlayState extends State<OnlinePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(
            'images/g22.gif',
          ),
        ),
        title: Text(
          "MeDaK Music",
          style: TextStyle(color: Color.fromARGB(255, 13, 192, 109)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName: 'com.spotify.music', openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/spotify.jpg'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 35, 36, 37),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName:
                          'com.google.android.apps.youtube.music',
                      openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/youtubemusic.webp'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName: 'com.gaana', openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/gaana1.jpg'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName: 'com.amazon.mp3', openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/amazon.webp'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName: 'com.jio.media.jiobeats',
                      openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/jio.png'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await LaunchApp.openApp(
                      androidPackageName: 'tunein.player', openStore: true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/TuneIn1.jpg'),
                            fit: BoxFit.fill),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
