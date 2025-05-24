import 'package:world_tour/models/country.dart';

import 'http_service.dart';

class CountryService {
  final HttpService httpService;

  CountryService(this.httpService);

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await httpService.dio.get('/all');
      final List data = response.data;
      return data.map((e) => Country.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Connection error, please try again.');
    }
  }
}
