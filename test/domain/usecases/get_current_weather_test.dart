import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app_sample/domain/entities/weather.dart';
import 'package:flutter_weather_app_sample/domain/usecases/get_current_weather.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockWeatherRepository);
  });

  const testWeatherDetail = Weather(
    name: 'Clear',
    description: 'clear sky',
    iconCode: '01d',
    temperature: 282.55,
    pressure: 1023,
    humidity: 100,
  );

  const tCityName = 'Jakarta';

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
      when(mockWeatherRepository.getCurrentWeather(tCityName))
          .thenAnswer((_) async => const Right(testWeatherDetail));

      // act
      final result = await usecase.execute(tCityName);

      // assert
      expect(result, equals(Right(testWeatherDetail)));
    },
  );
}
