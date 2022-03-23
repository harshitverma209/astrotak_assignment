import 'package:astrotak_assignment/constants.dart';
import 'package:astrotak_assignment/controller/ask_question_page_controller.dart';
import 'package:astrotak_assignment/data_provider.dart';
import 'package:astrotak_assignment/styles/styles.dart';
import 'package:astrotak_assignment/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category_api_response_model.dart';

class AskQuestionPage extends StatelessWidget {
  AskQuestionPage({Key? key}) : super(key: key);
  final AskQuestionPageController controller =
      Get.put(AskQuestionPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          iconImage,
          height: 60,
        ),
        centerTitle: true,
        leading: Image.asset(
          'assets/images/hamburger.png',
          height: 40,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => ProfilePage());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/profile.png',
                height: 50,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Wallet Header
          Container(
            color: Colors.indigo,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Wallet Balance : ₹ 0",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add Money',
                        style: TextStyle(color: Colors.indigo),
                      ),
                      style: innerButtonStyle)
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ask a Question',
                        style: headingText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        askAQuestionText,
                        textAlign: TextAlign.justify,
                        style: usualText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Choose Category',
                        style: headingText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GetBuilder<AskQuestionPageController>(
                          id: 'categoryDropdown',
                          builder: ((AskQuestionPageController controller) {
                            // return Text(controller.categories.length.toString());
                            if (controller.categories.isEmpty) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return DropdownButton<QuestionCategory>(
                                // hint: Text('LOL'),
                                value: controller.selectedCategory ??
                                    controller.categories[0],
                                isExpanded: true,
                                items: controller.categories
                                    .map((e) =>
                                        DropdownMenuItem<QuestionCategory>(
                                          child: Text(e.name),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (QuestionCategory? value) {
                                  controller.selectCategory(
                                      value ?? controller.categories[0]);
                                });
                          })
                          // child:
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                          controller: controller.questionController,
                          onChanged: (_) {
                            controller.updateQuestionTextCounter();
                          },
                          minLines: 5,
                          maxLines: 5,
                          maxLength: 150,
                          decoration: InputDecoration(
                              hintText: 'Type a question here',
                              counter: GetBuilder<AskQuestionPageController>(
                                id: 'questionTextCounter',
                                builder: (controller) {
                                  return Text(
                                      '${controller.questionController.text.length}/150');
                                },
                                // child: ,
                              ),
                              border: const OutlineInputBorder())),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ideas what to Ask (Select Any)',
                        style: headingText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        child: GetBuilder<AskQuestionPageController>(
                            id: 'suggestions',
                            builder: (controller) {
                              return ListView(
                                  children: controller
                                          .selectedCategory?.suggestions
                                          .map((e) => InkWell(
                                                onTap: () {
                                                  controller.setQuestionText(e);
                                                },
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons
                                                            .live_help_outlined,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        e,
                                                        style: usualText,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList() ??
                                      []);
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        afterAskAQuestionText,
                        style: usualText,
                      ),
                    ),
                    Container(
                      color: const Color.fromARGB(255, 255, 240, 235),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        askAQuestionEndText,
                        style: usualText.copyWith(color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.indigo,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<AskQuestionPageController>(
                  id: 'bottomPersistentBar',
                  builder: (controller) {
                    return Text(
                      '₹ ${controller.selectedCategory?.price ?? 0} (1 Question on ${controller.selectedCategory?.name ?? 'Nothing'})',
                      style: usualText.copyWith(color: Colors.white),
                    );
                  },
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Ask Now',
                    style: usualText.copyWith(color: Colors.indigo),
                  ),
                  style: innerButtonStyle,
                )
              ],
            ),
          ),
        )
      ],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(homeImage)), label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(talkImage)), label: 'Talk'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(askQuestionImage)),
              label: 'Ask Question'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(reportsImage)), label: 'Reports'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(chatImage)), label: 'Chat')
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.menu),
          backgroundColor: Colors.orange),
    );
  }
}
