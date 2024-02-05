import 'package:get/get.dart';
import 'package:medak/startingPages/starting_page_1.dart';
import 'package:permission_handler/permission_handler.dart';

class Srtpage extends GetxController {

  movingpage() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => Home());
  }

  // permission for access local storage
   checkpermission() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
    } 
    else {
      checkpermission();
    }
  }
}
