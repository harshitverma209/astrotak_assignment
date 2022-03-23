import 'package:astrotak_assignment/controller/add_edit_profile_controller.dart';
import 'package:get/get.dart';

import '../model/relative_api_respsonse_model.dart';

class FriendsAndFamilyProfileController extends GetxController {
  bool addEditDetailScreen = false;
  void goToAddEditScreen() {
    addEditDetailScreen = true;
    update(['tab']);
  }

  void goToRelativeScreen() {
    addEditDetailScreen = false;
    Get.delete<AddEditProfileController>();
    update(['tab']);
  }
}
