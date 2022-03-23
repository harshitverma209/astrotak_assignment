import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoryAPIResponseModel {
  final String httpStatus;
  final int httpStatusCode;
  final bool success;
  final String message;
  final List<QuestionCategory> data;
  CategoryAPIResponseModel({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  CategoryAPIResponseModel copyWith({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    List<QuestionCategory>? data,
  }) {
    return CategoryAPIResponseModel(
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
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryAPIResponseModel.fromMap(Map<String, dynamic> map) {
    return CategoryAPIResponseModel(
      httpStatus: map['httpStatus'] ?? '',
      httpStatusCode: map['httpStatusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: List<QuestionCategory>.from(map['data']?.map((x) => QuestionCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryAPIResponseModel.fromJson(String source) =>
      CategoryAPIResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryAPIResponseModel(httpStatus: $httpStatus, httpStatusCode: $httpStatusCode, success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryAPIResponseModel &&
        other.httpStatus == httpStatus &&
        other.httpStatusCode == httpStatusCode &&
        other.success == success &&
        other.message == message &&
        listEquals(other.data, data);
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

class QuestionCategory {
  final int id;
  final String name;
  final int price;
  final String description;
  final List<String> suggestions;
  QuestionCategory({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.suggestions,
  });

  QuestionCategory copyWith({
    int? id,
    String? name,
    int? price,
    String? description,
    List<String>? suggestions,
  }) {
    return QuestionCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      suggestions: suggestions ?? this.suggestions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'suggestions': suggestions,
    };
  }

  factory QuestionCategory.fromMap(Map<String, dynamic> map) {
    return QuestionCategory(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
      suggestions: List<String>.from(map['suggestions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionCategory.fromJson(String source) => QuestionCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, name: $name, price: $price, description: $description, suggestions: $suggestions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionCategory &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        listEquals(other.suggestions, suggestions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        description.hashCode ^
        suggestions.hashCode;
  }
}
