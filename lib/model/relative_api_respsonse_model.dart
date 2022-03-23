import 'dart:convert';

import 'package:flutter/foundation.dart';

class RelativesApiResponseModel {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final Data data;
  RelativesApiResponseModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  RelativesApiResponseModel copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    Data? data,
  }) {
    return RelativesApiResponseModel(
      httpStatus: httpStatus ?? this.httpStatus,
      httpStatusCode: httpStatusCode ?? this.httpStatusCode,
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'httpStatus': httpStatus,
      'httpStatusCode': httpStatusCode,
      'success': success,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory RelativesApiResponseModel.fromMap(Map<String, dynamic> map) {
    return RelativesApiResponseModel(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RelativesApiResponseModel.fromJson(String source) =>
      RelativesApiResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RelativesApiResponseModel(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RelativesApiResponseModel &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode {
    return httpStatus.hashCode ^
        httpStatusCode.hashCode ^
        success.hashCode ^
        message.hashCode ^
        data.hashCode;
  }
}

class Data {
  final int pageNo;
  final int numberOfElements;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final List<Relative> allRelatives;
  Data({
    required this.pageNo,
    required this.numberOfElements,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.allRelatives,
  });

  Data copyWith({
    int? pageNo,
    int? numberOfElements,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    List<Relative>? allRelatives,
  }) {
    return Data(
      pageNo: pageNo ?? this.pageNo,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      pageSize: pageSize ?? this.pageSize,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
      allRelatives: allRelatives ?? this.allRelatives,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pageNo': pageNo,
      'numberOfElements': numberOfElements,
      'pageSize': pageSize,
      'totalElements': totalElements,
      'totalPages': totalPages,
      'allRelatives': allRelatives.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      pageNo: map['pageNo']?.toInt() ?? 0,
      numberOfElements: map['numberOfElements']?.toInt() ?? 0,
      pageSize: map['pageSize']?.toInt() ?? 0,
      totalElements: map['totalElements']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      allRelatives: List<Relative>.from(
          map['allRelatives']?.map((x) => Relative.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(pageNo: $pageNo, numberOfElements: $numberOfElements, pageSize: $pageSize, totalElements: $totalElements, totalPages: $totalPages, allRelatives: $allRelatives)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.pageNo == pageNo &&
        other.numberOfElements == numberOfElements &&
        other.pageSize == pageSize &&
        other.totalElements == totalElements &&
        other.totalPages == totalPages &&
        listEquals(other.allRelatives, allRelatives);
  }

  @override
  int get hashCode {
    return pageNo.hashCode ^
        numberOfElements.hashCode ^
        pageSize.hashCode ^
        totalElements.hashCode ^
        totalPages.hashCode ^
        allRelatives.hashCode;
  }
}

class Relative {
  final String uuid;
  final int relationId;
  final String relation;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String gender;
  final String dateAndTimeOfBirth;
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;
  Relative({
    required this.uuid,
    required this.relationId,
    required this.relation,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });

  Relative copyWith({
    String? uuid,
    int? relationId,
    String? relation,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fullName,
    String? gender,
    String? dateAndTimeOfBirth,
    BirthDetails? birthDetails,
    BirthPlace? birthPlace,
  }) {
    return Relative(
      uuid: uuid ?? this.uuid,
      relationId: relationId ?? this.relationId,
      relation: relation ?? this.relation,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      dateAndTimeOfBirth: dateAndTimeOfBirth ?? this.dateAndTimeOfBirth,
      birthDetails: birthDetails ?? this.birthDetails,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'relationId': relationId,
      'relation': relation,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'fullName': fullName,
      'gender': gender,
      'dateAndTimeOfBirth': dateAndTimeOfBirth,
      'birthDetails': birthDetails.toMap(),
      'birthPlace': birthPlace.toMap(),
    };
  }

  factory Relative.fromMap(Map<String, dynamic> map) {
    return Relative(
      uuid: map['uuid'] ?? '',
      relationId: map['relationId']?.toInt() ?? 0,
      relation: map['relation'] ?? '',
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      fullName: map['fullName'] ?? '',
      gender: map['gender'] ?? '',
      dateAndTimeOfBirth: map['dateAndTimeOfBirth'] ?? '',
      birthDetails: BirthDetails.fromMap(map['birthDetails']),
      birthPlace: BirthPlace.fromMap(map['birthPlace']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Relative.fromJson(String source) =>
      Relative.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllRelative(uuid: $uuid, relationId: $relationId, relation: $relation, firstName: $firstName, middleName: $middleName, lastName: $lastName, fullName: $fullName, gender: $gender, dateAndTimeOfBirth: $dateAndTimeOfBirth, birthDetails: $birthDetails, birthPlace: $birthPlace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Relative &&
        other.uuid == uuid &&
        other.relationId == relationId &&
        other.relation == relation &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.fullName == fullName &&
        other.gender == gender &&
        other.dateAndTimeOfBirth == dateAndTimeOfBirth &&
        other.birthDetails == birthDetails &&
        other.birthPlace == birthPlace;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        relationId.hashCode ^
        relation.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        fullName.hashCode ^
        gender.hashCode ^
        dateAndTimeOfBirth.hashCode ^
        birthDetails.hashCode ^
        birthPlace.hashCode;
  }
}

class BirthDetails {
  final int dobYear;
  final int dobMonth;
  final int dobDay;
  final int tobHour;
  final String meridiem;
  final int tobMin;
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.meridiem,
    required this.tobMin,
  });

  BirthDetails copyWith({
    int? dobYear,
    int? dobMonth,
    int? dobDay,
    int? tobHour,
    String? meridiem,
    int? tobMin,
  }) {
    return BirthDetails(
      dobYear: dobYear ?? this.dobYear,
      dobMonth: dobMonth ?? this.dobMonth,
      dobDay: dobDay ?? this.dobDay,
      tobHour: tobHour ?? this.tobHour,
      meridiem: meridiem ?? this.meridiem,
      tobMin: tobMin ?? this.tobMin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dobYear': dobYear,
      'dobMonth': dobMonth,
      'dobDay': dobDay,
      'tobHour': tobHour,
      'meridiem': meridiem,
      'tobMin': tobMin,
    };
  }

  factory BirthDetails.fromMap(Map<String, dynamic> map) {
    return BirthDetails(
      dobYear: map['dobYear']?.toInt() ?? 0,
      dobMonth: map['dobMonth']?.toInt() ?? 0,
      dobDay: map['dobDay']?.toInt() ?? 0,
      tobHour: map['tobHour']?.toInt() ?? 0,
      meridiem: map['meridiem'] ?? '',
      tobMin: map['tobMin']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirthDetails.fromJson(String source) =>
      BirthDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BirthDetails(dobYear: $dobYear, dobMonth: $dobMonth, dobDay: $dobDay, tobHour: $tobHour, meridiem: $meridiem, tobMin: $tobMin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BirthDetails &&
        other.dobYear == dobYear &&
        other.dobMonth == dobMonth &&
        other.dobDay == dobDay &&
        other.tobHour == tobHour &&
        other.meridiem == meridiem &&
        other.tobMin == tobMin;
  }

  @override
  int get hashCode {
    return dobYear.hashCode ^
        dobMonth.hashCode ^
        dobDay.hashCode ^
        tobHour.hashCode ^
        meridiem.hashCode ^
        tobMin.hashCode;
  }
}

class BirthPlace {
  final String placeName;
  final String placeId;
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });

  BirthPlace copyWith({
    String? placeName,
    String? placeId,
  }) {
    return BirthPlace(
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

  factory BirthPlace.fromMap(Map<String, dynamic> map) {
    return BirthPlace(
      placeName: map['placeName'] ?? '',
      placeId: map['placeId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BirthPlace.fromJson(String source) =>
      BirthPlace.fromMap(json.decode(source));

  @override
  String toString() => 'BirthPlace(placeName: $placeName, placeId: $placeId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BirthPlace &&
        other.placeName == placeName &&
        other.placeId == placeId;
  }

  @override
  int get hashCode => placeName.hashCode ^ placeId.hashCode;
}
