import 'package:astrotak_assignment/data_provider.dart';
import 'package:astrotak_assignment/model/relative_api_respsonse_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllRelativesPageController extends GetxController {
  PagingController<int, Relative> pagedRelativesController =
      PagingController(firstPageKey: 1);

  Relative? selectedRelative;

  void selectRelative(Relative relative) {
    selectedRelative = relative;
  }

  @override
  void onInit() {
    super.onInit();
    pagedRelativesController.addPageRequestListener((pageKey) {
      fetchRelativesList(pageKey);
    });
  }

  void fetchRelativesList(int pageKey) {
    fetchRelatives(pageKey).then((relativeApiModel) {
      List<Relative> items = relativeApiModel.data.allRelatives;
      final isLastPage = items.length < 10;
      if (isLastPage) {
        pagedRelativesController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        pagedRelativesController.appendPage(items, nextPageKey);
      }
    });
  }

  void refreshRelatives() {
    pagedRelativesController.refresh();
  }

  void deleteRelative(String uuid) {
    deleteRelativeProfile(uuid).then((_) {
      Get.back();
      refreshRelatives();
    });
  }

  String getTimeOfBirth(Relative item) {
    return item.dateAndTimeOfBirth.substring(
        item.dateAndTimeOfBirth.indexOf('T') + 1,
        item.dateAndTimeOfBirth.indexOf('T') + 6);
  }
}
