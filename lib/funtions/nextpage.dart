import 'package:get/get.dart';
import 'package:medak/navigationbar/bottomnavigationbar.dart';
import 'package:medak/pages/homePage.dart';
import 'package:medak/pages/musicPlayerPage.dart';
import 'package:medak/pages/music_liberey.dart';
import 'package:medak/pages/searchPage.dart';

class Pagenavi extends GetxController{

  nextpage() async {
  if (pageindex == 0) {
    Get.to(() => OnlinePlay());
  } else if (pageindex == 1) {
    Get.to(() => Srhpage());
  } else if (pageindex == 2) {
    Get.to(() => Musicplaypage());
  } else if (pageindex == 3) {
    Get.to(() => Library());
  }
}
}
