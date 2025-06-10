import 'package:json_annotation/json_annotation.dart';

part 'travel_history.g.dart';

@JsonSerializable()
class TravelHistory {
  final String id;
  final String destination;
  final String purpose;
  final DateTime startDate;
  final DateTime endDate;
  final double cost;
  final String status;
  final String department;
  final HotelDetails? hotel;

  TravelHistory({
    required this.id,
    required this.destination,
    required this.purpose,
    required this.startDate,
    required this.endDate,
    required this.cost,
    required this.status,
    required this.department,
    this.hotel,
  });

  factory TravelHistory.fromJson(Map<String, dynamic> json) =>
      _$TravelHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TravelHistoryToJson(this);
}

@JsonSerializable()
class HotelDetails {
  final String name;
  final String address;
  final DateTime checkIn;
  final DateTime checkOut;
  final double cost;

  HotelDetails({
    required this.name,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    required this.cost,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}