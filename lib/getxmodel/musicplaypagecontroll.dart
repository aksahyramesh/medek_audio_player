// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class Musicplayercontroller extends GetxController{
  

// @override
//   // void onInit() {
//   //   // TODO: implement onInit
//   //   playmusica();
    
//   //   super.onInit();//
  
 

//   var playindex = 0.obs;
//   var isPlaying = false.obs;
//   var duration = ''.obs;
//   var position = ''.obs;
//   var max = 0.0.obs;
//   var value = 0.0.obs;

//    final audioStroge = OnAudioQuery();
//   final audioplayerSep = AudioPlayer();
  
 
//    void playAudioSlide(seconds) async {
//     var duration = Duration(seconds: seconds);
//     audioplayerSep.seek(duration);
//   }

// playmusic(String? music, index,) {
//     playindex.value = index;
//     try {
    
      
//       audioplayerSep.setAudioSource(
//         AudioSource.uri(
//           Uri.parse(music!),
         
//         ),
//       );
//       audioplayerSep.play();
//       isPlaying(true);
//       updationSong();
//     } on Exception catch (e) {
//       print(e.toString());
//     }
//   }
//   updationSong() {
//     audioplayerSep.durationStream.listen((d) {
//       duration.value = d.toString().split(".")[0];
//       max.value = d!.inSeconds.toDouble();
//     });
//     audioplayerSep.positionStream.listen((p) {
//       position.value = p.toString().split(".")[0];
//       value.value = p.inSeconds.toDouble();
//     });
//   }


// // playmusica(){ try {
// //       audioplayerSep.setAudioSource(
// //         AudioSource.uri(
// //           Uri.parse(music!),
// //           tag: MediaItem(id: "", title: 'title')
// //         ),
// //       );
// //       audioplayerSep.play();
// //       isPlaying(true);
// //       updationSong();
// //     }




// }










