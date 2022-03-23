import 'package:astrotak_assignment/controller/fAndFProfileController.dart';
import 'package:astrotak_assignment/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_edit_relative_detail_page.dart';
import 'all_relatives_page.dart';

class FriendsAndFamilyProfilePage extends StatelessWidget {
  FriendsAndFamilyProfilePage({Key? key}) : super(key: key);
  final FriendsAndFamilyProfileController controller =
      Get.put(FriendsAndFamilyProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendsAndFamilyProfileController>(
        id: 'tab',
        builder: (controller) {
          return controller.addEditDetailScreen
              ? AddEditRelativeDetailPage(
                  fAndFController: controller,
                )
              : AllRelativesPage(fAndFController: controller);
        });
  }
}
