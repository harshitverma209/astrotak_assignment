import 'package:astrotak_assignment/data_provider.dart';
import 'package:astrotak_assignment/model/category_api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AskQuestionPageController extends GetxController {
  List<QuestionCategory> categories = <QuestionCategory>[].obs;
  QuestionCategory? selectedCategory;
  TextEditingController questionController = TextEditingController();
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() {
    fetchCategories().then((categoryAPIResponseModel) {
      categories = categoryAPIResponseModel.data;
      selectedCategory = categories[0];
      update(['categoryDropdown', 'suggestions']);
    });
  }

  void selectCategory(QuestionCategory value) {
    selectedCategory = value;
    update(['categoryDropdown', 'suggestions', 'bottomPersistentBar']);
  }

  void updateQuestionTextCounter() {
    update(['questionTextCounter']);
  }

  void setQuestionText(String e) {
    questionController.text = e;
    updateQuestionTextCounter();
  }
}
