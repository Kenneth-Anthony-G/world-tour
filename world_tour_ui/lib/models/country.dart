class Country {
  final String officialName;
  final String englishName;
  final String frenchName;
  final String capital;
  final List<String> cities;
  final String region;
  final String flagUrl;
  final double area;
  final String language;
  final String currency;
  final int population;
  final String phoneCode;
  final String timeZone; // Added field for timezone

  Country({
    required this.officialName,
    required this.englishName,
    required this.frenchName,
    required this.capital,
    required this.cities,
    required this.region,
    required this.flagUrl,
    required this.area,
    required this.language,
    required this.currency,
    required this.population,
    required this.phoneCode,
    required this.timeZone, // Added in constructor
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    // Extracting first currency
    final currencyEntry = (json['currencies'] as Map?)?.entries.first;
    final currency = currencyEntry?.value['name'] ?? '';

    // Extracting first language
    final languageEntry = (json['languages'] as Map?)?.entries.first;
    final language = languageEntry?.value ?? '';

    // Composing phone code
    final phoneRoot = json['idd']?['root'] ?? '';
    final phoneSuffixes = json['idd']?['suffixes'] ?? [];
    final phoneCode = phoneSuffixes.isNotEmpty ? '$phoneRoot${phoneSuffixes[0]}' : '';

    // Extracting first timezone
    final timezones = json['timezones'] as List<dynamic>?;
    final timezone = (timezones != null && timezones.isNotEmpty) ? timezones.first : '';

    return Country(
      officialName: json['name']?['official'] ?? '',
      englishName: json['translations']?['eng']?['common'] ?? '',
      frenchName: json['translations']?['fra']?['common'] ?? '',
      region: json['region'] ?? '',
      flagUrl: json['flags']['png'] ?? '',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : '',
      cities: (json['capital'] != null && json['capital'].isNotEmpty)
          ? List<String>.from(json['capital']).take(3).toList()
          : ['Asmara', 'Keren', 'Massawa'],
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      language: language,
      currency: currency,
      population: json['population'] ?? 0,
      phoneCode: phoneCode,
      timeZone: timezone, // Assigned here
    );
  }
}
