class Country {
  final String officialName;
  final String englishName;
  final String frenchName;
  final String capital;
  final String region;
  final String flagUrl;
  final double area;
  final String language;
  final int population;

  Country({
    required this.officialName,
    required this.englishName,
    required this.region,
    required this.frenchName,
    required this.capital,
    required this.flagUrl,
    required this.area,
    required this.language,
    required this.population,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      officialName: json['name']?['official'] ?? '',
      englishName: json['translations']?['eng']?['common'] ?? '',
      frenchName: json['translations']?['fra']?['common'] ?? '',
      region: json['region'] ?? '',
      flagUrl: json['flags']['png'] ?? '',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : '',
      area: (json['area'] as num?)?.toDouble() ?? 0.0,
      language: json['languages'] != null
          ? (json['languages'] as Map<String, dynamic>).values.first
          : '',
      population: json['population'] ?? 0,
    );
  }
}
