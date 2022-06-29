import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app_sample/domain/entities/weather.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
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

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        //TODO: Check if this is the right approach
        feelsLike: json['main']['feels_like'].toDouble(),
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'feels_like': feelsLike,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };

  Weather toEntity() => Weather(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        feelsLike: feelsLike,
        pressure: pressure,
        humidity: humidity,
      );

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
