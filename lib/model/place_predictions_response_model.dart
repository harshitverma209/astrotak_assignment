import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlacePredictionsResponseModel {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final List<Place> places;
  PlacePredictionsResponseModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.places,
  });

  PlacePredictionsResponseModel copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    List<Place>? data,
  }) {
    return PlacePredictionsResponseModel(
      httpStatus: httpStatus ?? this.httpStatus,
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      success: success ?? this.success,
      message: message ?? this.message,
      places: data ?? this.places,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'httpStatus': httpStatus,
      'httpStatusCode': httpStatusCode,
      'success': success,
      'message': message,
      'data': places.map((x) => x.toMap()).toList(),
    };
  }

  factory PlacePredictionsResponseModel.fromMap(Map<String, dynamic> map) {
    return PlacePredictionsResponseModel(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      places: List<Place>.from(map['data']?.map((x) => Place.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacePredictionsResponseModel.fromJson(String source) =>
      PlacePredictionsResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlacePredictionresponseModel(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, data: $places)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlacePredictionsResponseModel &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        listEquals(other.places, places);
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        httpStatusCode.hashCode ^
        success.hashCode ^
        message.hashCode ^
        places.hashCode;
  }
}

class Place {
  final String placeName;
  final String placeId;
  Place({
    required this.placeName,
    required this.placeId,
  });

  Place copyWith({
    String? placeName,
    String? placeId,
  }) {
    return Place(
      placeName: placeName ?? this.placeName,
      placeId: placeId ?? this.placeId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'placeName': placeName,
      'placeId': placeId,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      placeName: map['placeName'] ?? '',
      placeId: map['placeId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));

  @override
  String toString() => 'Data(placeName: $placeName, placeId: $placeId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Place &&
        other.placeName == placeName &&
        other.placeId == placeId;
  }

  @override
  int get hashCode => placeName.hashCode ^ placeId.hashCode;
}
