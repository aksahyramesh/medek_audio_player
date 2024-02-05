import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medak/getxmodel/playercontroller.dart';
import 'package:medak/pages/musicPlayerPage.dart';
import 'package:on_audio_query/on_audio_query.dart'; // Replace with your actual import path

class Srhpage extends StatefulWidget {
  const Srhpage({Key? key});

  @override
  State<Srhpage> createState() => _SrhpageState();
}

class _SrhpageState extends State<Srhpage> {
  final PlayerController getcontrl = Get.put(PlayerController());
  TextEditingController textcon = TextEditingController();

  RxList<SongModel> searchResults = <SongModel>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent, width: 4),
                      color: const Color.fromARGB(255, 65, 63, 63),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        controller: textcon,
                        onChanged: (value) {
                          performSearch();
                        },
                        decoration: InputDecoration(
                          hintText: ' Search',
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          prefixIconColor: Colors.greenAccent,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  var audio = searchResults[index];
                  return ListTile(
                    leading: QueryArtworkWidget(
                      id: searchResults[index].id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Image.asset(
                        'images/bbbb.gif',
                        fit: BoxFit.cover,
                        width: 30,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: Color.fromARGB(160, 171, 226, 161)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: Text(audio.title,
                        maxLines: 1, style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      audio.artist ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      final aaa = searchResults.length;

                      if (index == aaa) {
                        index = index % aaa;

                        getcontrl.playmusix(searchResults[0].uri, 0);
                      } else {
                        getcontrl.playmusix(searchResults[index].uri, index);
                      }

                      Get.to(
                        () => Musicplaypage(
                          songname: searchResults,
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void performSearch() async {
    String searchText = textcon.text.trim();

    if (searchText.isNotEmpty) {
      List<SongModel> allSongs = await getcontrl.fetchAllSongs();

      // Perform case-insensitive search
      searchResults.assignAll(allSongs
          .where((song) =>
              song.title.toLowerCase().contains(searchText.toLowerCase()) ||
              song.artist!.toLowerCase().contains(searchText.toLowerCase()))
          .toList());
    }
  }
}
