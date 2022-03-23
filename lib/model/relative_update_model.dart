import 'dart:convert';

class RelativeUpdateModel {
  final String uuid;
  final String relation;
  final int relationId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String gender;
  // final String dateAndTimeOfBirth;
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;
  RelativeUpdateModel({
    required this.uuid,
    required this.relation,
    required this.relationId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    // required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });

  RelativeUpdateModel copyWith({
    String? uuid,
    String? relation,
    int? relationId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fullName,
    String? gender,
    // String? dateAndTimeOfBirth,
    BirthDetails? birthDetails,
    BirthPlace? birthPlace,
  }) {
    return RelativeUpdateModel(
      uuid: uuid ?? this.uuid,
      relation: relation ?? this.relation,
      relationId: relationId ?? this.relationId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      // dateAndTimeOfBirth: dateAndTimeOfBirth ?? this.dateAndTimeOfBirth,
      birthDetails: birthDetails ?? this.birthDetails,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'relation': relation,
      'relationId': relationId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'fullName': fullName,
      'gender': gender,
      // 'dateAndTimeOfBirth': dateAndTimeOfBirth,
      'birthDetails': birthDetails.toMap(),
      'birthPlace': birthPlace.toMap(),
    };
  }

  factory RelativeUpdateModel.fromMap(Map<String, dynamic> map) {
    return RelativeUpdateModel(
      uuid: map['uuid'] ?? '',
      relation: map['relation'] ?? '',
      relationId: map['relationId']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      fullName: map['fullName'] ?? '',
      gender: map['gender'] ?? '',
      // dateAndTimeOfBirth: map['dateAndTimeOfBirth'] ?? '',
      birthDetails: BirthDetails.fromMap(map['birthDetails']),
      birthPlace: BirthPlace.fromMap(map['birthPlace']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RelativeUpdateModel.fromJson(String source) =>
      RelativeUpdateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RelativeUpdateModel(uuid: $uuid, relation: $relation, relationId: $relationId, firstName: $firstName, middleName: $middleName, lastName: $lastName, fullName: $fullName, gender: $gender, birthDetails: $birthDetails, birthPlace: $birthPlace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RelativeUpdateModel &&
        other.uuid == uuid &&
        other.relation == relation &&
        other.relationId == relationId &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.fullName == fullName &&
        other.gender == gender &&
        // other.dateAndTimeOfBirth == dateAndTimeOfBirth &&
        other.birthDetails == birthDetails &&
        other.birthPlace == birthPlace;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        relation.hashCode ^
        relationId.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        fullName.hashCode ^
        gender.hashCode ^
        // dateAndTimeOfBirth.hashCode ^
        birthDetails.hashCode ^
        birthPlace.hashCode;
  }
}

class MiddleName {}

class BirthDetails {
  final int dobYear;
  final int dobMonth;
  final int dobDay;
  final int tobHour;
  final int tobMin;
  final String meridiem;
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });

  BirthDetails copyWith({
    int? dobYear,
    int? dobMonth,
    int? dobDay,
    int? tobHour,
    int? tobMin,
    String? meridiem,
  }) {
    return BirthDetails(
      dobYear: dobYear ?? this.dobYear,
      dobMonth: dobMonth ?? this.dobMonth,
      dobDay: dobDay ?? this.dobDay,
      tobHour: tobHour ?? this.tobHour,
      tobMin: tobMin ?? this.tobMin,
      meridiem: meridiem ?? this.meridiem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dobYear': dobYear,
      'dobMonth': dobMonth,
      'dobDay': dobDay,
      'tobHour': tobHour,
      'tobMin': tobMin,
      'meridiem': meridiem,
    };
  }

  factory BirthDetails.fromMap(Map<String, dynamic> map) {
    return BirthDetails(
      dobYear: map['dobYear']?.toInt() ?? 0,
      dobMonth: map['dobMonth']?.toInt() ?? 0,
      dobDay: map['dobDay']?.toInt() ?? 0,
      tobHour: map['tobHour']?.toInt() ?? 0,
      tobMin: map['tobMin']?.toInt() ?? 0,
      meridiem: map['meridiem'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BirthDetails.fromJson(String source) =>
      BirthDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BirthDetails(dobYear: $dobYear, dobMonth: $dobMonth, dobDay: $dobDay, tobHour: $tobHour, tobMin: $tobMin, meridiem: $meridiem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BirthDetails &&
        other.dobYear == dobYear &&
        other.dobMonth == dobMonth &&
        other.dobDay == dobDay &&
        other.tobHour == tobHour &&
        other.tobMin == tobMin &&
        other.meridiem == meridiem;
  }

  @override
  int get hashCode {
    return dobYear.hashCode ^
        dobMonth.hashCode ^
        dobDay.hashCode ^
        tobHour.hashCode ^
        tobMin.hashCode ^
        meridiem.hashCode;
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
