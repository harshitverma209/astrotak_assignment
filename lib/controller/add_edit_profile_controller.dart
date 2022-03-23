import 'dart:async';

import 'package:astrotak_assignment/controller/all_relatives_page_controller.dart';
import 'package:astrotak_assignment/data_provider.dart';
import 'package:astrotak_assignment/getXIDs.dart';
import 'package:astrotak_assignment/model/RelationModel.dart';
import 'package:flutter/material.dart';
import 'package:astrotak_assignment/constants.dart' as constants;
import 'package:get/get.dart';

import '../model/place_predictions_response_model.dart';
import '../model/relative_add_model.dart' as radd;
import '../model/relative_api_respsonse_model.dart';
import '../model/relative_update_model.dart' as rup;
import 'fAndFProfileController.dart';

class AddEditProfileController extends GetxController {
  final AllRelativesPageController _allRelativesPageController =
      Get.find<AllRelativesPageController>();
  Relative? relative;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  List<bool> meridiemSelectedList = [true, false];
  List<String> meridiemsAvailable = ['AM', 'PM'];
  int meridiemSelectedIndex = 0;
  final genders = constants.genders;
  final relations = constants.relations;
  String? selectedGender;
  RelationModel? selectedRelation;

  String? placeId;

  String appBarText = 'Add New Profile';

  @override
  void onInit() {
    super.onInit();
    relative = _allRelativesPageController.selectedRelative;
    if (relative != null) {
      nameController.text = relative!.fullName;
      dateController.text = '${relative!.birthDetails.dobDay}';
      monthController.text = '${relative!.birthDetails.dobMonth}';
      yearController.text = '${relative!.birthDetails.dobYear}';
      hoursController.text = '${relative!.birthDetails.tobHour}';
      minutesController.text = '${relative!.birthDetails.tobMin}';
      placeController.text = relative!.birthPlace.placeName;
      selectedGender = relative!.gender;
      selectedRelation =
          RelationModel(relative!.relation, relative!.relationId);
      placeId = relative!.birthPlace.placeId;

      appBarText = 'Update Profile';
      update();
    }
  }

  @override
  void onClose() {
    _allRelativesPageController.selectedRelative = null;
    super.onClose();
  }

  final String? Function(String? value) nameValidator = ((value) {
    if (value == null || !value.replaceAll(" ", "").isAlphabetOnly) {
      return 'Not a Name';
    }
    return null;
  });
// final String? Function(String? value)

  String? dateValidator(String? value) {
    if (value == null ||
        !value.isNumericOnly ||
        int.parse(value) <= 0 ||
        int.parse(value) > 31) {
      return 'Invalid DD';
    }
    return null;
  }

  String? monthValidator(String? value) {
    if (value == null ||
        !value.isNumericOnly ||
        int.parse(value) <= 0 ||
        int.parse(value) > 12) {
      return 'Invalid MM';
    }
    return null;
  }

  String? yearValidator(String? value) {
    if (value == null ||
        !value.isNumericOnly ||
        int.parse(value) <= 1900 ||
        int.parse(value) > 2022) {
      return 'Invalid Year';
    }
    return null;
  }

  String? hourValidator(String? value) {
    if (value == null ||
        !value.isNumericOnly ||
        int.parse(value) <= 0 ||
        int.parse(value) > 12) {
      return 'Invalid HH';
    }
    return null;
  }

  String? minuteValidator(String? value) {
    if (value == null ||
        !value.isNumericOnly ||
        int.parse(value) < 0 ||
        int.parse(value) >= 60) {
      return 'Invalid MM';
    }
    return null;
  }

  String? placeValidator(String? value) {
    if (value == null || value.isEmpty || placeId == null) {
      return 'Invalid Place';
    }
    return null;
  }

  String? relationValidator(RelationModel? value) {
    if (value == null || value.relation.isEmpty) {
      return 'Invalid Relation';
    }
    return null;
  }

  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid Gender';
    }
    return null;
  }

  Future<List<Place>> getPlaceSuggestions(String inputPlace) async {
    if (inputPlace.isEmpty) {
      return [];
    }
    List<Place> places = (await fetchPlacePredictions(inputPlace)).places;
    return places;
  }

  void usePlaceSuggestion(Place suggestion) {
    placeController.text = suggestion.placeName;
    placeId = suggestion.placeId;
    update([placeField]);
  }

  void addOrUpdateProfile() {
    if (relative == null) {
      //Add Profile
      _addProfile();
    } else {
      //Update Profile
      _updateProfile();
    }
  }

  void _addProfile() {
    String fullName = nameController.text;
    String firstName = fullName.split(" ").first;
    String lastName =
        fullName.split(" ").length > 1 ? fullName.split(" ")[1] : "";
    radd.RelativeAddModel relativeAddModel = radd.RelativeAddModel(
        birthDetails: radd.BirthDetails(
            dobDay: int.parse(dateController.text),
            dobMonth: int.parse(monthController.text),
            dobYear: int.parse(yearController.text),
            meridiem: meridiemsAvailable[meridiemSelectedIndex],
            tobHour: int.parse(hoursController.text),
            tobMin: int.parse(minutesController.text)),
        birthPlace:
            radd.BirthPlace(placeId: placeId!, placeName: placeController.text),
        firstName: firstName,
        lastName: lastName,
        relationId: selectedRelation!.relationId,
        gender: selectedGender!);

    addRelativeProfile(relativeAddModel).then((value) {
      Get.back();
      Get.find<AllRelativesPageController>().refreshRelatives();

      Get.find<FriendsAndFamilyProfileController>().goToRelativeScreen();
    });
  }

  void _updateProfile() {
    String fullName = nameController.text;
    String firstName = fullName.split(" ").first;
    String lastName =
        fullName.split(" ").length > 1 ? fullName.split(" ")[1] : "";
    rup.RelativeUpdateModel relativeUpdateModel = rup.RelativeUpdateModel(
        birthDetails: rup.BirthDetails(
            dobDay: int.parse(dateController.text),
            dobMonth: int.parse(monthController.text),
            dobYear: int.parse(yearController.text),
            meridiem: meridiemsAvailable[meridiemSelectedIndex],
            tobHour: int.parse(hoursController.text),
            tobMin: int.parse(minutesController.text)),
        birthPlace:
            rup.BirthPlace(placeId: placeId!, placeName: placeController.text),
        firstName: firstName,
        lastName: lastName,
        relationId: selectedRelation!.relationId,
        fullName: relative!.fullName,
        // dateAndTimeOfBirth: relative!.dateAndTimeOfBirth,
        middleName: relative!.middleName,
        relation: selectedRelation!.relation,
        uuid: relative!.uuid,
        gender: selectedGender!);

    updateRelativeProfile(relativeUpdateModel).then((value) {
      Get.back();
      Get.find<AllRelativesPageController>().refreshRelatives();

      Get.find<FriendsAndFamilyProfileController>().goToRelativeScreen();
    });
  }

  void selectGender(String? value) {
    if (value != null) {
      selectedGender = value;
    }
  }

  void selectRelation(RelationModel? value) {
    if (value != null) {
      selectedRelation = value;
    }
  }

  void selectMeridiem(int selected) {
    for (int buttonIndex = 0;
        buttonIndex < meridiemSelectedList.length;
        buttonIndex++) {
      if (buttonIndex == selected) {
        meridiemSelectedList[buttonIndex] = true;
      } else {
        meridiemSelectedList[buttonIndex] = false;
      }
    }
    meridiemSelectedIndex = selected;
    update([meridiemField]);
  }
}
