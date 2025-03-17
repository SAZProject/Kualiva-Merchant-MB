// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OutletModel {
  final String id;
  final String userMerchantId;
  final String outletName;
  final String address;
  final String phoneBusiness;
  final String emailOptional;
  final String businessLicenseFile;
  final double latitude;
  final double longitude;
  final String googlePlaceId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final List<int> operationalDay;
  final List<TimeOfDay> operationalTimeOpen;
  final List<TimeOfDay> operationalTimeClose;
  final List<String> menuPicture;

  OutletModel({
    required this.id,
    required this.userMerchantId,
    required this.outletName,
    required this.address,
    required this.phoneBusiness,
    required this.emailOptional,
    required this.businessLicenseFile,
    required this.latitude,
    required this.longitude,
    required this.googlePlaceId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.operationalDay,
    required this.operationalTimeOpen,
    required this.operationalTimeClose,
    required this.menuPicture,
  });

  OutletModel copyWith({
    String? id,
    String? userMerchantId,
    String? outletName,
    String? address,
    String? phoneBusiness,
    String? emailOptional,
    String? businessLicenseFile,
    double? latitude,
    double? longitude,
    String? googlePlaceId,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<int>? operationalDay,
    List<TimeOfDay>? operationalTimeOpen,
    List<TimeOfDay>? operationalTimeClose,
    List<String>? menuPicture,
  }) {
    return OutletModel(
      id: id ?? this.id,
      userMerchantId: userMerchantId ?? this.userMerchantId,
      outletName: outletName ?? this.outletName,
      address: address ?? this.address,
      phoneBusiness: phoneBusiness ?? this.phoneBusiness,
      emailOptional: emailOptional ?? this.emailOptional,
      businessLicenseFile: businessLicenseFile ?? this.businessLicenseFile,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      googlePlaceId: googlePlaceId ?? this.googlePlaceId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      operationalDay: operationalDay ?? this.operationalDay,
      operationalTimeOpen: operationalTimeOpen ?? this.operationalTimeOpen,
      operationalTimeClose: operationalTimeClose ?? this.operationalTimeClose,
      menuPicture: menuPicture ?? this.menuPicture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userMerchantId': userMerchantId,
      'outletName': outletName,
      'address': address,
      'phoneBusiness': phoneBusiness,
      'emailOptional': emailOptional,
      'businessLicenseFile': businessLicenseFile,
      'latitude': latitude,
      'longitude': longitude,
      'googlePlaceId': googlePlaceId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'deletedAt': deletedAt.millisecondsSinceEpoch,
      'operationalDay': operationalDay,
      'operationalTimeOpen': operationalTimeOpen,
      'operationalTimeClose': operationalTimeClose,
      'menuPicture': menuPicture,
    };
  }

  factory OutletModel.fromMap(Map<String, dynamic> map) {
    return OutletModel(
      id: map['id'] as String,
      userMerchantId: map['userMerchantId'] as String,
      outletName: map['outletName'] as String,
      address: map['address'] as String,
      phoneBusiness: map['phoneBusiness'] as String,
      emailOptional: map['emailOptional'] as String,
      businessLicenseFile: map['businessLicenseFile'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      googlePlaceId: map['googlePlaceId'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      deletedAt: DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int),
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
    return 'OutletModel(id: $id, userMerchantId: $userMerchantId, outletName: $outletName, address: $address, phoneBusiness: $phoneBusiness, emailOptional: $emailOptional, businessLicenseFile: $businessLicenseFile, latitude: $latitude, longitude: $longitude, googlePlaceId: $googlePlaceId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, operationalDay: $operationalDay, operationalTimeOpen: $operationalTimeOpen, operationalTimeClose: $operationalTimeClose, menuPicture: $menuPicture)';
  }

  @override
  bool operator ==(covariant OutletModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userMerchantId == userMerchantId &&
        other.outletName == outletName &&
        other.address == address &&
        other.phoneBusiness == phoneBusiness &&
        other.emailOptional == emailOptional &&
        other.businessLicenseFile == businessLicenseFile &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.googlePlaceId == googlePlaceId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        listEquals(other.operationalDay, operationalDay) &&
        listEquals(other.operationalTimeOpen, operationalTimeOpen) &&
        listEquals(other.operationalTimeClose, operationalTimeClose) &&
        listEquals(other.menuPicture, menuPicture);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userMerchantId.hashCode ^
        outletName.hashCode ^
        address.hashCode ^
        phoneBusiness.hashCode ^
        emailOptional.hashCode ^
        businessLicenseFile.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        googlePlaceId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        operationalDay.hashCode ^
        operationalTimeOpen.hashCode ^
        operationalTimeClose.hashCode ^
        menuPicture.hashCode;
  }
}
