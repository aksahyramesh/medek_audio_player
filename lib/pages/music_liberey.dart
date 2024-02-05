import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medak/getxmodel/playercontroller.dart';

import 'package:on_audio_query/on_audio_query.dart';

import 'musicPlayerPage.dart';

class Library extends StatelessWidget {
  Library({
    super.key,
    this.songName,
  });
  List<SongModel> allsong = [];

  var songName;

  var controller = Get.put(PlayerController());
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Stack(
          children: [
            FutureBuilder<List<SongModel>>(
              future: controller.audioStroge.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      semanticsLabel:'No audios found' ,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 4),
                            child: Obx(
                              () => ListTile(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                tileColor: Color.fromARGB(255, 244, 244, 244)
                                    .withOpacity(.6)
                                    .withOpacity(1),
                                title: Text(
                                  "${snapshot.data![index].displayNameWOExt}",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 32, 33, 32)),
                                ),
                                subtitle: Text(
                                  "${snapshot.data![index].artist}",
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 3, 3, 3)),
                                ),
                                leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: Image.asset(
                                    'images/listimage.png',
                                    width: 30,
                                  ),
                                ),
                                trailing: controller.playindex.value == index &&
                                        controller.isPlaying.value
                                    ? Icon(
                                        Icons.pause_circle,
                                        color:
                                            Color.fromARGB(255, 97, 235, 101),
                                      )
                                    : null,
                                onTap: () {
                                  allsong.addAll(snapshot.data!);

                                  controller.isPlaying.value = false;
                                  songName = snapshot.data!;
                                

                                  Get.to(
                                      () => Musicplaypage(
                                            songname: allsong,
                                          ),
                                      transition: Transition.downToUp);
                                  controller.playmusix(
                                      allsong[index].uri, index);
                                 controller.autoPlayNextSong(snapshot.data!.map((song) => song.uri).toList());



                                 
                                },
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
            Obx(
              () => Positioned(
                bottom: -9,
                right: 30,
                child: IconButton(
                    onPressed: () {
                      //  Get.to(
                      //                       () => Musicplaypage(
                      //                             songname: songName,
                      //                           ));
                      controller.isPlaying.value = !controller.isPlaying.value;
                      if (controller.isPlaying == true) {
                        controller.audioplayerr.play();
                      } else {
                        controller.audioplayerr.pause();
                      }
                    },
                    icon: controller.isPlaying == false
                        ? Icon(Icons.play_circle_fill,
                            size: 90, color: Color.fromARGB(255, 76, 199, 67))
                        : Icon(Icons.pause_circle_filled_sharp,
                            size: 90, color: Color.fromARGB(255, 76, 199, 67))),
              ),
            )
          ],
        ));
  }
}
