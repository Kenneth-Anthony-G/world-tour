import 'package:flutter/material.dart';
import 'package:world_tour/models/country.dart';
import '../services/country_service.dart';
import '../services/http_service.dart';
import '../widgets/country_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}class _HomeScreenState extends State<HomeScreen> {
  final _httpService = HttpService();
  late final CountryService _countryService;
  late Future<List<Country>> _futureCountries;

  final TextEditingController _searchController = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _countryService = CountryService(_httpService);
    _futureCountries = _loadCountries();
    _searchController.addListener(_onSearchChanged);
  }

  // Fetch all countries and initialize the filtered list
  Future<List<Country>> _loadCountries() async {
    final countries = await _countryService.fetchCountries();
    _allCountries = countries;
    _filteredCountries = countries;
    return countries;
  }

  // Filter countries based on search query
  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCountries = _allCountries
          .where((country) =>
      country.officialName.toLowerCase().contains(query) ||
          country.englishName.toLowerCase().contains(query) ||
          country.frenchName.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries')),
      body: FutureBuilder<List<Country>>(
        future: _futureCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      labelText: 'Search by name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _filteredCountries.isEmpty
                    ? const Center(child: Text('No countries found'))
                    : ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = _filteredCountries[index];
                    return CountryCard(country: country);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}