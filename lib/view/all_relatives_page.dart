import 'package:astrotak_assignment/controller/all_relatives_page_controller.dart';
import 'package:astrotak_assignment/view/processing_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controller/fAndFProfileController.dart';
import '../model/relative_api_respsonse_model.dart';
import '../styles/styles.dart';

class AllRelativesPage extends StatelessWidget {
  AllRelativesPage({
    Key? key,
    required this.fAndFController,
  }) : super(key: key);

  final FriendsAndFamilyProfileController fAndFController;
  final AllRelativesPageController controller =
      Get.put(AllRelativesPageController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.indigo[100]),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  'Wallet Balance: ₹ 0',
                  style: usualText.copyWith(color: Colors.indigo),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: OutlinedButton(
                    style: innerButtonStyle,
                    onPressed: () {},
                    child: Text(
                      'Add Money',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Text(
                    'Name',
                    style: tableHeading,
                  )),
              Spacer(),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 5,
                  child: Text(
                    'DOB',
                    style: tableHeading,
                  )),
              Spacer(),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Text(
                    'TOB',
                    style: tableHeading,
                  )),
              Spacer(),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Text(
                    'Relation',
                    style: tableHeading,
                  )),
              Flexible(
                fit: FlexFit.tight,
                flex: 7,
                child: Container(),
              ),
            ],
          ),
        ),
        Expanded(
          child: PagedListView<int, Relative>.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              pagingController: controller.pagedRelativesController,
              builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: ((context, item, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 3,
                            child: Text(
                              '${item.firstName} ${item.lastName}',
                              style: tableData,
                            )),
                        Spacer(),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 5,
                            child: Text(
                              '${item.birthDetails.dobDay}-${item.birthDetails.dobMonth}-${item.birthDetails.dobYear}',
                              style: tableData,
                            )),
                        Spacer(),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 3,
                            child: Text(
                              controller.getTimeOfBirth(item),
                              // '${item.birthDetails.tobHour}:${item.birthDetails.tobMin} ${item.birthDetails.meridiem}',
                              style: tableData,
                            )),
                        Spacer(),
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 4,
                            child: Text(
                              '${item.relation}',
                              style: tableData,
                            )),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 7,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller.selectedRelative = item;
                                  fAndFController.goToAddEditScreen();
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.generalDialog(pageBuilder: ((context,
                                      animation, secondaryAnimation) {
                                    return DeleteConfirmationDialog(
                                        item: item, controller: controller);
                                  }));
                                  // controller.deleteRelative(item.uuid);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))),
        ),
        Container(
          margin: EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () {
              fAndFController.goToAddEditScreen();
            },
            label: Text('Add New Profile'),
            style: fAndFButton,
          ),
        )
      ],
    );
  }
}

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    Key? key,
    required this.controller,
    required this.item,
  }) : super(key: key);
  final Relative item;
  final AllRelativesPageController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Do you really want to delete?'),
      // actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.deleteRelative(item.uuid);
                    Get.generalDialog(
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                ProcessingDialog()));
                  },
                  child: Text('Yes'),
                  style: fAndFButton,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('No'),
                  style: fAndFButton,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
