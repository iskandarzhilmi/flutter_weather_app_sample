import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double feelsLike;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props => [
        cityName,
        main,
        description,
        iconCode,
        feelsLike,
        pressure,
        humidity,
      ];
}
