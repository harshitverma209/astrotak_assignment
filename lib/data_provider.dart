import 'package:astrotak_assignment/model/category_api_response_model.dart';
import 'package:astrotak_assignment/model/place_predictions_response_model.dart';
import 'package:astrotak_assignment/model/relative_add_model.dart';
import 'package:astrotak_assignment/model/relative_api_respsonse_model.dart';
import 'package:http/http.dart' as http;

import 'model/relative_update_model.dart';

const String _baseURL = 'https://staging-api.astrotak.com/api/';
const String _bearerToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiODZhYTlhODItYjlhOS00NGFiLTkyYzQtODY4YjIyYzA4ZTY0IiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijg4MDk3NjUxOTEiLCJlbWFpbCI6ImFiaGlzaGVrLnNhaEBhYWp0YWsuY29tIiwibWFza2VkRW1haWwiOiJhYmgqKioqKioqKiphYWp0YWsuY29tIiwiZXhpc3RpbmdVc2VyIjpmYWxzZSwiaWF0IjoxNjQ3OTQ1MjY3LCJleHAiOjE2Njc5NDUyNjd9.whYbyeeBt91qni3zzp5eaitD2eKVnPI5scjiG49J_ks';
// const String _bearerToken =
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E';
Future<CategoryAPIResponseModel> fetchCategories() async {
  String rawUrl = _baseURL + 'question/category/all';
  Uri url = Uri.parse(rawUrl);
  http.Response response = await http.get(url);
  CategoryAPIResponseModel categoryAPIResponseModel =
      CategoryAPIResponseModel.fromJson(response.body);
  return categoryAPIResponseModel;
}

Future<RelativesApiResponseModel> fetchRelatives(int pageKey) async {
  String rawUrl = _baseURL + 'relative/all';
  Uri url = Uri.parse(rawUrl);
  http.Response response =
      await http.get(url, headers: {'Authorization': 'Bearer $_bearerToken'});
  RelativesApiResponseModel relativesApiResponseModel =
      RelativesApiResponseModel.fromJson(response.body);
  return relativesApiResponseModel;
}

Future<PlacePredictionsResponseModel> fetchPlacePredictions(
    String inputPlace) async {
  String rawUrl = _baseURL + 'location/place?inputPlace=${inputPlace}';
  Uri url = Uri.parse(rawUrl);
  http.Response response = await http.get(url);
  PlacePredictionsResponseModel placePredictionsResponseModel =
      PlacePredictionsResponseModel.fromJson(response.body);
  return placePredictionsResponseModel;
}

Future<void> addRelativeProfile(RelativeAddModel relativeAddModel) async {
  String rawUrl = _baseURL + 'relative/';
  Uri url = Uri.parse(rawUrl);
  http.Response response = await http.post(url,
      headers: {
        'Authorization': 'Bearer $_bearerToken',
        "Content-Type": "application/json"
      },
      body: relativeAddModel.toJson());
  return;
}

Future<void> updateRelativeProfile(
    RelativeUpdateModel relativeUpdateModel) async {
  String rawUrl = _baseURL + 'relative/update/${relativeUpdateModel.uuid}';
  Uri url = Uri.parse(rawUrl);
  http.Response response = await http.post(url,
      headers: {
        'Authorization': 'Bearer $_bearerToken',
        "Content-Type": "application/json"
      },
      body: relativeUpdateModel.toJson());
  print(response.body);
  return;
}

Future<void> deleteRelativeProfile(String uuid) async {
  String rawUrl = _baseURL + 'relative/delete/${uuid}';
  Uri url = Uri.parse(rawUrl);
  http.Response response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $_bearerToken',
    },
  );
  return;
}
