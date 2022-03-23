import 'dart:convert';

class RelativeAddModel {
  final BirthDetails birthDetails;
  final BirthPlace birthPlace;
  final String firstName;
  final String lastName;
  final int relationId;
  final String gender;
  RelativeAddModel({
    required this.birthDetails,
    required this.birthPlace,
    required this.firstName,
    required this.lastName,
    required this.relationId,
    required this.gender,
  });

  RelativeAddModel copyWith({
    BirthDetails? birthDetails,
    BirthPlace? birthPlace,
    String? firstName,
    String? lastName,
    int? relationId,
    String? gender,
  }) {
    return RelativeAddModel(
      birthDetails: birthDetails ?? this.birthDetails,
      birthPlace: birthPlace ?? this.birthPlace,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      relationId: relationId ?? this.relationId,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'birthDetails': birthDetails.toMap(),
      'birthPlace': birthPlace.toMap(),
      'firstName': firstName,
      'lastName': lastName,
      'relationId': relationId,
      'gender': gender,
    };
  }

  factory RelativeAddModel.fromMap(Map<String, dynamic> map) {
    return RelativeAddModel(
      birthDetails: BirthDetails.fromMap(map['birthDetails']),
      birthPlace: BirthPlace.fromMap(map['birthPlace']),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      relationId: map['relationId']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RelativeAddModel.fromJson(String source) =>
      RelativeAddModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RelativeAddModel(birthDetails: $birthDetails, birthPlace: $birthPlace, firstName: $firstName, lastName: $lastName, relationId: $relationId, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RelativeAddModel &&
        other.birthDetails == birthDetails &&
        other.birthPlace == birthPlace &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.relationId == relationId &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return birthDetails.hashCode ^
        birthPlace.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        relationId.hashCode ^
        gender.hashCode;
  }
}

class BirthDetails {
  final int dobDay;
  final int dobMonth;
  final int dobYear;
  final int tobHour;
  final int tobMin;
  final String meridiem;
  BirthDetails({
    required this.dobDay,
    required this.dobMonth,
    required this.dobYear,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });

  BirthDetails copyWith({
    int? dobDay,
    int? dobMonth,
    int? dobYear,
    int? tobHour,
    int? tobMin,
    String? meridiem,
  }) {
    return BirthDetails(
      dobDay: dobDay ?? this.dobDay,
      dobMonth: dobMonth ?? this.dobMonth,
      dobYear: dobYear ?? this.dobYear,
      tobHour: tobHour ?? this.tobHour,
      tobMin: tobMin ?? this.tobMin,
      meridiem: meridiem ?? this.meridiem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dobDay': dobDay,
      'dobMonth': dobMonth,
      'dobYear': dobYear,
      'tobHour': tobHour,
      'tobMin': tobMin,
      'meridiem': meridiem,
    };
  }

  factory BirthDetails.fromMap(Map<String, dynamic> map) {
    return BirthDetails(
      dobDay: map['dobDay']?.toInt() ?? 0,
      dobMonth: map['dobMonth']?.toInt() ?? 0,
      dobYear: map['dobYear']?.toInt() ?? 0,
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
    return 'BirthDetails(dobDay: $dobDay, dobMonth: $dobMonth, dobYear: $dobYear, tobHour: $tobHour, tobMin: $tobMin, meridiem: $meridiem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BirthDetails &&
        other.dobDay == dobDay &&
        other.dobMonth == dobMonth &&
        other.dobYear == dobYear &&
        other.tobHour == tobHour &&
        other.tobMin == tobMin &&
        other.meridiem == meridiem;
  }

  @override
  int get hashCode {
    return dobDay.hashCode ^
        dobMonth.hashCode ^
        dobYear.hashCode ^
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
