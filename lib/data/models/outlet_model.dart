// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OutletModel {
  final String outletName;
  final String uniqueId;
  final String claimedDate;
  final String contact;
  final String location;
  final List<String> tags;
  final List<int> operationalDay;
  final List<TimeOfDay> operationalTimeOpen;
  final List<TimeOfDay> operationalTimeClose;
  final List<String> menuPicture;

  OutletModel({
    required this.outletName,
    required this.uniqueId,
    required this.claimedDate,
    required this.contact,
    required this.location,
    required this.tags,
    required this.operationalDay,
    required this.operationalTimeOpen,
    required this.operationalTimeClose,
    required this.menuPicture,
  });

  OutletModel copyWith({
    String? outletName,
    String? uniqueId,
    String? claimedDate,
    String? contact,
    String? location,
    List<String>? tags,
    List<int>? operationalDay,
    List<TimeOfDay>? operationalTimeOpen,
    List<TimeOfDay>? operationalTimeClose,
    List<String>? menuPicture,
  }) {
    return OutletModel(
      outletName: outletName ?? this.outletName,
      uniqueId: uniqueId ?? this.uniqueId,
      claimedDate: claimedDate ?? this.claimedDate,
      contact: contact ?? this.contact,
      location: location ?? this.location,
      tags: tags ?? this.tags,
      operationalDay: operationalDay ?? this.operationalDay,
      operationalTimeOpen: operationalTimeOpen ?? this.operationalTimeOpen,
      operationalTimeClose: operationalTimeClose ?? this.operationalTimeClose,
      menuPicture: menuPicture ?? this.menuPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'outletName': outletName,
      'uniqueId': uniqueId,
      'claimedDate': claimedDate,
      'contact': contact,
      'location': location,
      'tags': tags,
      'operationalDay': operationalDay,
      'operationalTimeOpen': operationalTimeOpen,
      'operationalTimeClose': operationalTimeClose,
      'menuPicture': menuPicture,
    };
  }

  factory OutletModel.fromMap(Map<String, dynamic> map) {
    return OutletModel(
      outletName: map['outletName'] as String,
      uniqueId: map['uniqueId'] as String,
      claimedDate: map['claimedDate'] as String,
      contact: map['contact'] as String,
      location: map['location'] as String,
      tags: List<String>.from((map['tags'] as List<String>)),
      operationalDay: List<int>.from((map['operationalDay'] as List<int>)),
      operationalTimeOpen:
          List<TimeOfDay>.from((map['operationalTimeOpen'] as List<TimeOfDay>)),
      operationalTimeClose: List<TimeOfDay>.from(
          (map['operationalTimeClose'] as List<TimeOfDay>)),
      menuPicture: List<String>.from((map['menuPicture'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory OutletModel.fromJson(String source) =>
      OutletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OutletModel(outletName: $outletName, uniqueId: $uniqueId, claimedDate: $claimedDate, contact: $contact, location: $location, tags: $tags, operationalDay: $operationalDay, operationalTimeOpen: $operationalTimeOpen, operationalTimeClose: $operationalTimeClose, menuPicture: $menuPicture)';
  }

  @override
  bool operator ==(covariant OutletModel other) {
    if (identical(this, other)) return true;

    return other.outletName == outletName &&
        other.uniqueId == uniqueId &&
        other.claimedDate == claimedDate &&
        other.contact == contact &&
        other.location == location &&
        listEquals(other.tags, tags) &&
        listEquals(other.operationalDay, operationalDay) &&
        listEquals(other.operationalTimeOpen, operationalTimeOpen) &&
        listEquals(other.operationalTimeClose, operationalTimeClose) &&
        listEquals(other.menuPicture, menuPicture);
  }

  @override
  int get hashCode {
    return outletName.hashCode ^
        uniqueId.hashCode ^
        claimedDate.hashCode ^
        contact.hashCode ^
        location.hashCode ^
        tags.hashCode ^
        operationalDay.hashCode ^
        operationalTimeOpen.hashCode ^
        operationalTimeClose.hashCode ^
        menuPicture.hashCode;
  }
}
