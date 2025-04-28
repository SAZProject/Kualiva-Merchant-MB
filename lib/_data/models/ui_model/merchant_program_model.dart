// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

class MerchantProgramModel {
  final String programTitle;
  final IconData programIcon;
  final bool isActive;

  MerchantProgramModel({
    required this.programTitle,
    required this.programIcon,
    required this.isActive,
  });

  MerchantProgramModel copyWith({
    String? programTitle,
    IconData? programIcon,
    bool? isActive,
  }) {
    return MerchantProgramModel(
      programTitle: programTitle ?? this.programTitle,
      programIcon: programIcon ?? this.programIcon,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'programTitle': programTitle,
      'programIcon': programIcon.codePoint,
      'isActive': isActive,
    };
  }

  factory MerchantProgramModel.fromMap(Map<String, dynamic> map) {
    return MerchantProgramModel(
      programTitle: map['programTitle'] as String,
      programIcon:
          IconData(map['programIcon'] as int, fontFamily: 'MaterialIcons'),
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MerchantProgramModel.fromJson(String source) =>
      MerchantProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MerchantProgramModel(programTitle: $programTitle, programIcon: $programIcon, isActive: $isActive)';

  @override
  bool operator ==(covariant MerchantProgramModel other) {
    if (identical(this, other)) return true;

    return other.programTitle == programTitle &&
        other.programIcon == programIcon &&
        other.isActive == isActive;
  }

  @override
  int get hashCode =>
      programTitle.hashCode ^ programIcon.hashCode ^ isActive.hashCode;
}
