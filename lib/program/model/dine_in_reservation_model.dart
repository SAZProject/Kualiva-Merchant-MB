import 'dart:convert';

import 'package:flutter/widgets.dart';

class DineInReservationModel {
  final String reservationCode;
  final String reservationContent;
  final bool incomingReservationItem;
  final String? pendingReservationTime;
  final String? ongoingReservationTime;

  DineInReservationModel({
    required this.reservationCode,
    required this.reservationContent,
    required this.incomingReservationItem,
    this.pendingReservationTime,
    this.ongoingReservationTime,
  });

  DineInReservationModel copyWith({
    String? reservationCode,
    String? reservationContent,
    bool? incomingReservationItem,
    ValueGetter<String?>? pendingReservationTime,
    ValueGetter<String?>? ongoingReservationTime,
  }) {
    return DineInReservationModel(
      reservationCode: reservationCode ?? this.reservationCode,
      reservationContent: reservationContent ?? this.reservationContent,
      incomingReservationItem:
          incomingReservationItem ?? this.incomingReservationItem,
      pendingReservationTime: pendingReservationTime != null
          ? pendingReservationTime()
          : this.pendingReservationTime,
      ongoingReservationTime: ongoingReservationTime != null
          ? ongoingReservationTime()
          : this.ongoingReservationTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reservationCode': reservationCode,
      'reservationContent': reservationContent,
      'incomingReservationItem': incomingReservationItem,
      'pendingReservationTime': pendingReservationTime,
      'ongoingReservationTime': ongoingReservationTime,
    };
  }

  factory DineInReservationModel.fromMap(Map<String, dynamic> map) {
    return DineInReservationModel(
      reservationCode: map['reservationCode'] ?? '',
      reservationContent: map['reservationContent'] ?? '',
      incomingReservationItem: map['incomingReservationItem'] ?? false,
      pendingReservationTime: map['pendingReservationTime'],
      ongoingReservationTime: map['ongoingReservationTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DineInReservationModel.fromJson(String source) =>
      DineInReservationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DineInReservationModel(reservationCode: $reservationCode, reservationContent: $reservationContent, incomingReservationItem: $incomingReservationItem, pendingReservationTime: $pendingReservationTime, ongoingReservationTime: $ongoingReservationTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DineInReservationModel &&
        other.reservationCode == reservationCode &&
        other.reservationContent == reservationContent &&
        other.incomingReservationItem == incomingReservationItem &&
        other.pendingReservationTime == pendingReservationTime &&
        other.ongoingReservationTime == ongoingReservationTime;
  }

  @override
  int get hashCode {
    return reservationCode.hashCode ^
        reservationContent.hashCode ^
        incomingReservationItem.hashCode ^
        pendingReservationTime.hashCode ^
        ongoingReservationTime.hashCode;
  }
}
