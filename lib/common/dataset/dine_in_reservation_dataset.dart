import 'package:faker/faker.dart';
import 'package:kualiva_merchant_mb/program/model/dine_in_reservation_model.dart';

class DineInReservationDataset {
  final List<DineInReservationModel> listIncomingReservation = [
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: true,
    ),
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: true,
    ),
  ];

  final List<DineInReservationModel> listPendingReservation = [
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: false,
      pendingReservationTime: "dine_in_program.time_left",
    ),
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: false,
      pendingReservationTime: "dine_in_program.time_left",
    ),
  ];

  final List<DineInReservationModel> listOngoingReservation = [
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: false,
      ongoingReservationTime: Faker().date.time().split(" ").first,
    ),
    DineInReservationModel(
      reservationCode:
          "RES-01-${Faker().internet.macAddress().replaceAll(":", "")}",
      reservationContent: "dine_in_program.reservation_content",
      incomingReservationItem: false,
      ongoingReservationTime: Faker().date.time().split(" ").first,
    ),
  ];
}
