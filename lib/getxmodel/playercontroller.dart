import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'package:on_audio_query/on_audio_query.dart';

class PlayerController extends GetxController {
  @override
  final audioStroge = OnAudioQuery();
  final audioplayerr = AudioPlayer();

  TextEditingController textEditingControllerr = TextEditingController();

  var musicget = Get.arguments;
  var playindex = 0.obs;
  var isPlaying = false.obs;
  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  updationSong() {
    audioplayerr.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioplayerr.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  playmusix(String? music, index) {
    playindex.value = index;
    try {
      audioplayerr.setAudioSource(
        AudioSource.uri(
          Uri.parse(music!),
        ),
      );

      audioplayerr.play();
      isPlaying(true);
      updationSong();
    } on Exception catch (e) {
      print(e.toString());
    }
  }


  void playAudioSlide(seconds) async {
    var duration = Duration(seconds: seconds);
    audioplayerr.seek(duration);
  }
  //test

  void autoPlayNextSong(List<String?> songListt) async {
    audioplayerr.playerStateStream.listen((state) async {
      if (state.processingState == ProcessingState.completed) {
        playindex.value = (playindex.value + 1);

        // Play the next song
        await playmusix(
          songListt[playindex.value]!,
          playindex.value,
        );
      
        
      }
    });
  }

  Future<List<SongModel>> fetchAllSongs() async {
    // Fetch and return the list of songs from your source (OnAudioQuery or other)
    return await audioStroge.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );
  }

  void shufflecontrol(List<String?> songListt) async {
    audioplayerr.playerStateStream.listen((state) async {
      if (state.processingState == ProcessingState.completed) {
        playindex.value = (playindex.value + 1) % songListt.length;

        // Play the next song
        await playmusix(
          songListt[playindex.value]!,
          playindex.value,
        );
      }
    });
  }

  void shuffleSongs(List<String?> songListt) {
    // Use the Fisher-Yates shuffle algorithm
    songListt.shuffle();

    // Update playindex value and play the first song after shuffling
    playindex.value = 0;
    playmusix(songListt[playindex.value]!, playindex.value);
  }
}
