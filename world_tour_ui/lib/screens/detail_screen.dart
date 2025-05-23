import 'package:flutter/material.dart';

import '../models/country.dart';

class DetailScreen extends StatelessWidget {
  final Country country;

  const DetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.officialName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display flag
            Center(
              child: Image.network(
                country.flagUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text("Official Name: ${country.officialName}",
                style: const TextStyle(fontSize: 16)),
            Text("Capital: ${country.capital}",
                style: const TextStyle(fontSize: 16)),
            Text("Region: ${country.region}",
                style: const TextStyle(fontSize: 16)),
            Text("Population: ${country.population}",
                style: const TextStyle(fontSize: 16)),
            Text("Language: ${country.language}",
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
