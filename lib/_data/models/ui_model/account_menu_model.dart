// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class AccountMenuModel {
  final IconData? icon;
  final String? imageUri;
  final String label;
  final bool isRightIcon;

  AccountMenuModel({
    this.icon,
    this.imageUri,
    required this.label,
    required this.isRightIcon,
  });

  AccountMenuModel copyWith({
    IconData? icon,
    String? imageUri,
    String? label,
    bool? isRightIcon,
  }) {
    return AccountMenuModel(
      icon: icon ?? this.icon,
      imageUri: imageUri ?? this.imageUri,
      label: label ?? this.label,
      isRightIcon: isRightIcon ?? this.isRightIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon?.codePoint,
      'imageUri': imageUri,
      'label': label,
      'isRightIcon': isRightIcon,
    };
  }

  factory AccountMenuModel.fromMap(Map<String, dynamic> map) {
    return AccountMenuModel(
      icon: map['icon'] != null
          ? IconData(map['icon'] as int, fontFamily: 'MaterialIcons')
          : null,
      imageUri: map['imageUri'] != null ? map['imageUri'] as String : null,
      label: map['label'] as String,
      isRightIcon: map['isRightIcon'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountMenuModel.fromJson(String source) =>
      AccountMenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountMenuModel(icon: $icon, imageUri: $imageUri, label: $label, isRightIcon: $isRightIcon)';
  }

  @override
  bool operator ==(covariant AccountMenuModel other) {
    if (identical(this, other)) return true;

    return other.icon == icon &&
        other.imageUri == imageUri &&
        other.label == label &&
        other.isRightIcon == isRightIcon;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        imageUri.hashCode ^
        label.hashCode ^
        isRightIcon.hashCode;
  }
}
