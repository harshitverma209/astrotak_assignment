import 'package:astrotak_assignment/constants.dart';
import 'package:astrotak_assignment/controller/add_edit_profile_controller.dart';
import 'package:astrotak_assignment/controller/all_relatives_page_controller.dart';
import 'package:astrotak_assignment/controller/fAndFProfileController.dart';
import 'package:astrotak_assignment/getXIDs.dart' as gIDs;
import 'package:astrotak_assignment/model/RelationModel.dart';
import 'package:astrotak_assignment/styles/styles.dart';
import 'package:astrotak_assignment/view/processing_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../model/place_predictions_response_model.dart';

class AddEditRelativeDetailPage extends StatefulWidget {
  FriendsAndFamilyProfileController fAndFController;

  AddEditRelativeDetailPage({required this.fAndFController, Key? key})
      : super(key: key);

  @override
  State<AddEditRelativeDetailPage> createState() =>
      _AddEditRelativeDetailPageState();
}

class _AddEditRelativeDetailPageState extends State<AddEditRelativeDetailPage> {
  final _formKey = GlobalKey<FormState>();

  AddEditProfileController controller = Get.put(AddEditProfileController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    widget.fAndFController.goToRelativeScreen();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                "${controller.appBarText}",
                style: headingText,
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Name',
                      style: textFieldLabel,
                    ),
                  ),
                  GetBuilder<AddEditProfileController>(
                      id: gIDs.nameField,
                      builder: (controller) {
                        return TextFormField(
                          controller: controller.nameController,
                          validator: controller.nameValidator,
                          decoration:
                              textFieldDecoration.copyWith(hintText: 'Name'),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Date Of Birth',
                      style: textFieldLabel,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          // width: screenWidth / 4,
                          child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GetBuilder<AddEditProfileController>(
                            id: gIDs.dateField,
                            builder: (controller) {
                              return ProfileFormField(
                                  controller: controller.dateController,
                                  hintText: 'DD',
                                  showCounter: true,
                                  validator: controller.dateValidator,
                                  maxLength: 2,
                                  onChanged: (String? value) {
                                    controller.update([gIDs.dateField]);
                                  });
                            }),
                      )),
                      Expanded(
                          // width: screenWidth / 4,
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GetBuilder<AddEditProfileController>(
                          id: gIDs.monthField,
                          builder: (controller) {
                            return ProfileFormField(
                              controller: controller.monthController,
                              hintText: 'MM',
                              showCounter: true,
                              validator: controller.monthValidator,
                              maxLength: 2,
                              onChanged: (String? value) {
                                controller.update([gIDs.monthField]);
                              },
                            );
                          },
                        ),
                      )),
                      Expanded(
                        // width: screenWidth / 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GetBuilder<AddEditProfileController>(
                            id: gIDs.yearField,
                            builder: (controller) {
                              return ProfileFormField(
                                controller: controller.yearController,
                                hintText: 'YYYY',
                                showCounter: true,
                                validator: controller.yearValidator,
                                maxLength: 4,
                                onChanged: (String? value) {
                                  controller.update([gIDs.yearField]);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Time Of Birth',
                      style: textFieldLabel,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          // width: screenWidth / 4,
                          child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GetBuilder<AddEditProfileController>(
                          id: gIDs.hoursField,
                          builder: (controller) {
                            return ProfileFormField(
                              controller: controller.hoursController,
                              hintText: 'HH',
                              showCounter: true,
                              validator: controller.hourValidator,
                              maxLength: 2,
                              onChanged: (String? value) {
                                controller.update([gIDs.hoursField]);
                              },
                            );
                          },
                        ),
                      )),
                      Expanded(
                          // width: screenWidth / 4,
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GetBuilder<AddEditProfileController>(
                          id: gIDs.minutesField,
                          builder: (controller) {
                            return ProfileFormField(
                              controller: controller.minutesController,
                              hintText: 'MM',
                              showCounter: true,
                              validator: controller.minuteValidator,
                              maxLength: 2,
                              onChanged: (String? value) {
                                controller.update([gIDs.minutesField]);
                              },
                            );
                          },
                        ),
                      )),
                      Expanded(
                        // width: screenWidth / 4,
                        child: GetBuilder<AddEditProfileController>(
                            id: gIDs.meridiemField,
                            builder: (controller) {
                              return Center(
                                child: Card(
                                  child: ToggleButtons(
                                    borderRadius: BorderRadius.circular(5),
                                    textStyle: usualText,
                                    disabledColor: Colors.white,
                                    fillColor: Colors.indigo,
                                    selectedColor: Colors.white,
                                    color: Colors.black,
                                    children: controller.meridiemsAvailable
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(e),
                                            ))
                                        .toList(),
                                    isSelected: controller.meridiemSelectedList,
                                    onPressed: (selected) {
                                      controller.selectMeridiem(selected);
                                    },
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Place Of Birth',
                      style: textFieldLabel,
                    ),
                  ),
                  GetBuilder<AddEditProfileController>(
                    id: gIDs.placeField,
                    builder: (controller) {
                      return TypeAheadFormField<Place>(
                        validator: controller.placeValidator,
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controller.placeController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        suggestionsCallback: (pattern) async {
                          return await controller.getPlaceSuggestions(pattern);
                        },
                        itemBuilder: (context, Place suggestion) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(suggestion.placeName),
                          );
                        },
                        onSuggestionSelected: (Place suggestion) {
                          controller.usePlaceSuggestion(suggestion);
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            // width: screenWidth / 4,
                            child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Gender',
                                  style: textFieldLabel,
                                ))),
                        Expanded(
                            // width: screenWidth / 4,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Relation',
                                  style: textFieldLabel,
                                ))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        // width: screenWidth / 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GetBuilder<AddEditProfileController>(
                              id: gIDs.genderDropDown,
                              builder: (controller) {
                                return DropdownButtonFormField<String>(
                                    validator: controller.genderValidator,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                    value: controller.selectedGender,
                                    items: controller.genders
                                        .map((e) => DropdownMenuItem<String>(
                                              child: Text(e),
                                              value: e,
                                            ))
                                        .toList(),
                                    hint: Text('Gender'),
                                    onChanged: (String? value) {
                                      controller.selectGender(value);
                                    });
                              }),
                        ),
                      ),
                      Expanded(
                          // width: screenWidth / 4,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GetBuilder<AddEditProfileController>(
                            id: gIDs.relationDropDown,
                            builder: (controller) {
                              return DropdownButtonFormField<RelationModel>(
                                  validator: controller.relationValidator,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                  value: controller.selectedRelation,
                                  items: controller.relations
                                      .map((e) =>
                                          DropdownMenuItem<RelationModel>(
                                            child: Text(e.relation),
                                            value: e,
                                          ))
                                      .toList(),
                                  hint: Text('Relation'),
                                  onChanged: (RelationModel? value) {
                                    controller.selectRelation(value);
                                  });
                            }),
                      )),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('Processing Data')),
                            // );
                            //Form Validated
                            //Do Something
                            Get.generalDialog(
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) {
                                  return const ProcessingDialog();
                                }),
                                barrierDismissible: false);
                            controller.addOrUpdateProfile();
                          }
                        },
                        child: Text('Save Changes'),
                        style: fAndFButton,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileFormField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool showCounter;
  int? maxLength;
  String? Function(String?) validator;
  ValueChanged<String>? onChanged;
  ProfileFormField({
    required this.controller,
    required this.hintText,
    required this.showCounter,
    required this.validator,
    this.maxLength,
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      decoration: textFieldDecoration.copyWith(
          counterText:
              showCounter ? '${controller.text.length}/${maxLength}' : null,
          hintText: hintText),
    );
  }
}
